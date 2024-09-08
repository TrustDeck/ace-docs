---
glightbox: false
---

# Getting production ready
The service is designed to be deployed in a cloud environment, so we will use Docker Swarm in this guide.
You should also have a Linux-based server with an IP and SSH access for this guide. Once you have installed Docker as described in the [prerequisites](/getting-started/prerequisites/) , we can get started.
Docker already comes with Docker Swarm. This just needs to be activated. Docker Swarm works in a manager-worker principle.
You can read about [how this works](https://docs.docker.com/engine/swarm/how-swarm-mode-works/nodes/) and [how it can be activated here](https://docs.docker.com/engine/swarm/swarm-tutorial/create-swarm/).

For a complete fresh environment we need:

- Loadbalancer, we will use [Traefik](https://doc.traefik.io/traefik/) here
- Keycloak
- PostgreSQL database
- PSN API service

For security reasons we cannot provide certificates. You can get certificates from your provider, internal pki, [Let’s Encrypt](https://letsencrypt.org/de/) or you can generate your own.
Either way. In this guide we work with two different URLs `keycloak.intern` and `api.intrern`. These strings can be easily changed later in your environment by a "find and replace".
We also provide corresponding configurations, e.g. for Traefik. If you have any changes or hints we would be happy to receive your message in the form of an issue.

Let's get started.

## Docker stack

Unlike a docker-compose file in Docker, in Docker Swarm we talk about a stack. A stack can be designed so that its services are automatically deployed to the nodes in a distributed manner.
Here is the stack file we will use. Please pay attention to the comments in the file. We will cover them in more detail later.

```yaml title="docker.stack.yml"
--8<-- "docs/assets/files/docker.stack.yml"
```
You need the following commands to create the networks. This creates an overlay that is used to build a higher level network in Docker Swarm in which the services can mount themselves on different servers and thus use the internal ingress blancing.

```shell title="Create Networks within Docker as an Overlay"
docker network create -d overlay frontend --attachable
docker network create -d overlay backend --attachable
```
All other tasks, such as reading passwords or creation of the `ps_database_data` volume, are taken over by docker when the stack is started.

## Services

### Deploy options
Firstly, general configurations for each service are explained. Due to information security, it is necessary to specify precise information in order to keep control over the services.

#### Placement
```yaml title="Docker Swarm: placement option"
placement:
    constraints:
      - node.role == manager
#or
placement:
    constraints:
      - node.hostname == my.hostname.de
```
The server for the services **can and should** be explicitly specified either by the role `manager` or `worker` or by the hostname in the Docker Swarm.

#### Amount of services
```yaml title="Docker Swarm: amount of services"
mode: replicated
replicas: 1
```
This option specifies how often the service is replicated through the swarm. If the value in the file is changed (min. 1) and the stack is updated, the number of services changes automatically.
Furthermore, the load balancer used here automatically recognises each service without the need for further configuration. Exceptions exist in the configuration of services for example that require a sticky cookie because the service does not share the session internally.

#### Update Strategy
```yaml title="Docker Swarm: update strategy"
update_config:
    parallelism: 1
    order: start-first
    failure_action: rollback
    delay: 10s
rollback_config:
    parallelism: 0
    order: stop-first
```
Here, you can adjust the order and number of simultaneous service updates and configure the behaviour of the rollback if an error occurs.

#### Restart policy
```yaml title="Docker Swarm: restart policy"
restart_policy:
    condition: on-failure
    delay: 5s
    max_attempts: 5
```
Here you can configure the behaviour of restarts. A restart is triggered if the service crashes due to an error or a manual kill of a service happens.

#### Ressources
```yaml title="Docker Swarm: explicit set ressources"
resources:
    reservations:
      memory: 512M
      cpus: "0.01"
    limits:
      cpus: "0.6"
      memory: 2048M
```
This option allocates resources to a service per instance. CPU is specified in `float` values between `0` and `1.0`. For example, `0.5` is 50% of the total CPU capacity.

### Loadbalancer (traefik)

!!! note "Encryption"

    The Loadbalancer resolves the https connection and forwards internally to the services via http. Since the services are located in their own network, this can be done very well.
    For additional security, encryption can be activated in the communication between services within Docker Swarm. However, this usually leads to a massive loss of performance!

```yaml title="Configuration for traefik: traefik.yml"
--8<-- "docs/assets/files/traefik.yml"
```

This configuration is included in the stack in the volume section see [here](/guides/production-ready/#__codelineno-0-42).
```yaml title="Include Configuration read-only"
- ./files/traefik.yml:/etc/traefik/traefik.yml:ro
```

!!! abstract "You need 2 different files, a certificate and a private key for each domain."
In addition, the certificates are also included in the same section one line below.
```yaml title="Incldue certificates read-only"
- ./certs:/etc/traefik/certs:ro
```

### Keycloak
In the proposed stack, Keycloak is used in a SIngle cluster. This is suitable for most use cases.
To run a single cluster, it is sufficient to set the internal cache of Keycloak to 'local'.
```yaml title="Cache mode"
KC_CACHE: local
```

In addition, the service requires two further important settings to operate in the stack.
The hostname should correspond to the domain through which Keycloak is addressed.
```yaml title="Hostname des keycloak"
KC_HOSTNAME: keycloak.intern
```

This, and the following setting `KC_PROXY` in `edge`, allows Keycloak to be run in a Docker Swarm behind a loadbalancer like traefik.
```yaml title="Proxy mode"
KC_PROXY: edge
```

!!! hint "After a successful initial setup of the system, the following tasks still need to be completed"

    - [Create a realm](/guides/keycloak/realm/)
        - You can use the name `production` like in the suggested stack

    - [Create a client](/guides/keycloak/client/)
        - You can use the name `production-service` like in the suggested stack

    - [Create groups](/guides/keycloak/group/)
    - [Create roles](/guides/keycloak/role/)
        - [list of functional roles](/configuration/roles/) 
    - [Create mappers](/guides/keycloak/mapper/)
    - [Create Users and apply groups/roles](/guides/keycloak/user/)
    - optionally, if needed, [create provider](/guides/keycloak/provider/)

#### Custom Keycloak
It will probably be necessary to create a custom keycloak service in your environment.
We would like to give you some hints in the following section.
A good starting point can be found on the [official Keycloak page and the creation of a custom service.](https://www.keycloak.org/server/containers).

##### Integrating certifcates
If you plan to access an LDAP or other user directories, you will probably need to include certificates.
Because for internal processing Keycloak needs the correct format and decryption of the certificate.

```shell title="Example: Adjust and decrypt the format of the certificate"
openssl aes-256-cbc -d -a -pbkdf2 -in WindowsRootCA.cer.enc -out WindowsRootCA.cer -pass file:passphrase.txt
```

##### Docker Secret Support
Docker Secret Support has been removed from the builds of Keycloak. To use it anyway, the following script can be used, which will later be included in the start sequence of the service using a wrapper.

```bash title="read_docker_secret.sh"
#!/bin/bash -e

echo "Reading ENV's content from file ..."
#Covers all Envs starting with DOCKER_SECRET_ and ends with __FILE and replaces the content of the original env then correct sourced in the file
for VAR_NAME in $(env | grep '^DOCKER_SECRET_[^=]\+__FILE=.\+' | sed -r "s/DOCKER_SECRET_([^=]*)__FILE=.*/\1/g"); do
    VAR_NAME_FILE=DOCKER_SECRET_"$VAR_NAME"__FILE
    if [ "${!VAR_NAME}" ]; then
        unset "$VAR_NAME"
        echo >&2 "WARNING: Both $VAR_NAME_FILE and target $VAR_NAME ENV are set. Preferring FILE over ENV."
    fi
    echo "Mapping content from ${!VAR_NAME_FILE} to ${VAR_NAME}"
    export "$VAR_NAME"="$(< "${!VAR_NAME_FILE}")"
    unset "$VAR_NAME_FILE"
done
```

After using this script, you can populate all Docker environments via the file support.
To do this, you need to add `DOCKER_SECRET_` as a prefix and `__FILE` as a suffix. Take a look at this introduced stack file. The PSN API service already uses this mechanism.

##### Example Custom Dockerfile
In the following, we show you an example of a Dockerfile that has been extended with a certificate and Docker Secret Support.
```Dockerfile title="Custom Dockerfile for Keycloak"
FROM quay.io/keycloak/keycloak:21.1

USER root

COPY ./WindowsRootCA.cer /etc/pki/ca-trust/source/anchors/WindowsRootCA.cer
COPY ./read_docker_secret.sh /opt/keycloak/bin/read_docker_secret.sh

#You can find the wrapper.sh below
COPY ./wrapper.sh /opt/keycloak/bin/wrapper.sh

#remove this line with 'WindowsRootCA.cer' if you dont need a custom import from a certificate

RUN chmod +x /opt/keycloak/bin/wrapper.sh && \
    keytool -import -file /etc/pki/ca-trust/source/anchors/WindowsRootCA.cer -alias WindowsRootCA -storepass changeit -noprompt -keystore /lib/jvm/jre-17/lib/security/cacerts

ENTRYPOINT ["/opt/keycloak/bin/wrapper.sh"]    
```

!!! danger "Please note that the internal password for the `cacert` store is `changeit` which you should change."

Finally, you can start the original service with a wrapper, but first read and source the files in the enviroment via a docker secret script.
```bash title="wrapper.sh"
#!/bin/bash -e

#is mandatory due to override env to support docker secrets
source /opt/keycloak/bin/read_docker_secret.sh

#note that you can only pass one argument not endless anymore
/opt/keycloak/bin/kc.sh "$1"
```


### Database
When the database service is freshly created, the included SQL files are also executed once.
The database for the PSN API service and an empty database for keycloak are created.

All files to create databases on the services can be found here
```shell title="database init files"
examples/db
```

!!! danger "Do not use backups from development"

    Please note that for productive operation you should not use the backup of the development keycloak. It speeds up nothing and dramatically lowers the security of your services!

The following commands are for backup or restoring the database:
```shell title="Generic cli command: dump database"
docker exec -i <service_name> /bin/bash -c "PGPASSWORD=<db_password> pg_dump --clean --create --column-inserts --username <db_username> <db_name>" > sql_file_backup.sql
```
```shell title="Generic cli command: restore database"
docker exec -i <service_name> /bin/bash -c "PGPASSWORD=<db_password> psql --username <db_username> <db_name>" < sql_file_backup.sql
```
```shell title="Generic cli command: single sql statement execution"
docker exec -i <service_name> /bin/bash -c "PGPASSWORD=<db_password> psql --username <db_username> <db_name> -c '<sql_statement>'"
```

### PSN API service
If you need to adjust Docker environments, see [here](/configuration/service/#docker)

## Deploy
!!! danger "First initial start up"

    Please note that the first time you run the PSN API service, it will not start correctly because you have to set a client secret first. This will only be available after Keycloak has been set up.

```shell title="Stack starten/updaten"
docker stack deploy --compose-file docker.stack.yml psn --with-registry-auth --prune
```
This command starts a stack. If the stack already exists, it is updated by this command.

- `--with-registry-auth` Send registry authentication details to Docker Swarm workers
- `--prune` removes services that are no longer referenced to the stack


```shell title="Stack löschen"
docker stack rm psn
```
This command only deletes stacks **and never volumes**.

For more [options](https://docs.docker.com/engine/reference/commandline/stack_deploy/#options) or [commands](https://docs.docker.com/engine/reference/commandline/stack_deploy/#related-commands) look [here](https://docs.docker.com/engine/reference/commandline/stack_deploy/).

