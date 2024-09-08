---
glightbox: false
---

# Setup

!!! success "Prerequisites met?"

    Please keep in mind that we assume that you have installed any software listed in the [prerequisites](/getting-started/prerequisites/#in-development) under "In Development".

!!! info "Development only"
    
    This instruction should only be used in development. We have provided docker images which are automatically built by our pipeline.

!!! note "Please note that most commands can also be found in the local Makefile of the repository."

## Download 

```shell title="Use git to clone the repository of this services"
git clone https://github.com/TrustDeck/ace.git
```

## Preparing

### Configuration
First go to the resource folder and create your configuration `application.yml` by copy and renaming the file `application.yml.example`

```shell title="Create your configuration"
cd src/main/resources
cp application.yml.example application.yml
```

### Truststore
We already provided you an default truststore in `./src/main/resources/` which you can use.


The truststore is mandatory for spring boot to be able to interact with the underlying system over ssl in internal networks.
If you not want to use your truststore you can create your own. Use [this method](https://community.microstrategy.com/s/article/How-to-create-a-pem-trust-store-with-the-certificate-chain-of-SSL-TLS-secured-MicroStrategy-components?language=en_US) for specific one-domain-truststore with.

You can create truststore with this script from the projects root folder:

```shell title=""
cd ./scripts
sh gen_keystore.sh
```

This script automatically downloads the pki chain from: https://pki.pca.dfn.de/dfn-ca-global-g2/pub/cacert/chain.txt and creates a truststore named `pki_chain.truststore` with a random password stored in .keystore_password.

## Starting underlying systems

Because we want to implement and programme, we only need the underlying systems. We can simply use the provided `docker-compse.dev.yml`.

```shell title="start development-docker-compose"
docker-compose --project-name ace-dev --file docker-compose.dev.yml up
```

!!! note "You can add `-d` or `--detach` to run it into the background"

The docker-compose for development starts everything you need, including a test database for keycloak and the service. It works out of the box.
Please note that the given docker-compose file is for **development use** only.

### Our Keycloak default user:

The administrator user. Used to apply roles and change settings in keycloak:

| Attribute | Value |
|-----------|-------|
| Username  | admin |
| Password  | admin |


The test user. Also has all rights, but is used for testing:

| Attribute | Value |
|-----------|-------|
| Username  | test  |
| Password  | test  |

To stop everything use:
```shell title="stop development-docker-compose"
docker-compose --project-name ace-dev --file docker-compose.dev.yml stop 
```

## Interaction with the database

!!! warning "Please ..."

    ... make sure you are in the correct directory to store or restore the dump
    ```shell title=""
    cd src/test/resources/sql/
    ```

    ... make sure the name of the container e.g. `ps-postgresql` and also the credentials and name of the database matches.

    ... remember the user which is used to take the dump is written into the file as the owner.

### Dump Database within Docker
This simply pipes the output from the command into a file.
```shell title="General database dump"
docker exec -i ps-postgresql /bin/bash -c "PGPASSWORD=ps3udoNym1zation! pg_dump --clean --create --column-inserts --username ace-manager keycloak" > examples/db/keycloak-dump.sql
```

If you only need the schema, use this:
```shell title="Only schema dump"
docker exec -i ps-postgresql /bin/bash -c "PGPASSWORD=ps3udoNym1zation! pg_dump --clean --create --schema-only --no-comments --username ace-manager pseudonymization" > examples/db/pseudonymization-schema.sql
```

### Restoring Database Dump within Docker
This simply pipes the dump into the container.
```shell title="General Restoring"
docker exec -i ps-postgresql /bin/bash -c "PGPASSWORD=ps3udoNym1zation! psql --username ace-manager pseudonymization" < src/test/resources/sql/pseudonymization-dump.sql
```

### Running Database query within Docker
This is a short example that shows you how to execute a single query. With this method, it is not allowed to chain queries. Each command must be fired individually.
If you want to use several queries in series, create a file and pipe it as we did in restoring.

```shell title="Single query"
docker exec -i ps-postgresql /bin/bash -c "PGPASSWORD=ps3udoNym1zation! psql --username ace-manager postgres -c 'CREATE DATABASE test OWNER postgres;'"
```

## Generate jOOQ
Whenever the database structure is modified, the jooq code must be updated. To do this, use the following command in the CLI or use it in your IDE.

```shell title="generate jOOQ code"
mvn jooq-codegen:generate -f pom.xml
```

