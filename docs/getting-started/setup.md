---
glightbox: false
---

# Setup

--8<-- "docs/assets/snippets/testing-only-purposes.snippet"

In this quick setup, we use Docker Compose. However, you are free to install everything natively.
Make sure you have Docker installed before proceeding with this setup.

## Build

To start the service, we must build the relaying Docker image. [Follow these simple instructions to create the ace:latest image](/building-ace/#building-docker-image). Then, continue by using the docker-compose.yml file in the next "Start" section.

## Start

In the directory `assets/examples` of this repository you will find a ready-to-use Docker-Compose file for your first steps called `docker-compose.yml`.
This file is only for testing the whole service. 

Each container should be started one by one to avoid errors.
Before we can start make sure dockers internal domain `host.docker.internal` is bind to your maschines ip. To do so edit the file `/etc/hosts` and add:
```shell title="sudo nano /etc/hosts"
<ip>    host.docker.internal
``` 

First we start the database. The included SQL-Dump are used to create the necessary databases for Keycloak (with test data) and ACE.

```shell title="Start PostgreSQL"
docker compose --project-name ace --file docker-compose.yml up -d ace-postgresql
```

Go ahead with starting Keycloak after approximately 20 seconds and ACE.

```shell title="Start keycloak"
docker compose --project-name ace --file docker-compose.yml up -d ace-keycloak
```

```shell title="Start ACE"
docker compose --project-name ace --file docker-compose.yml up -d ace
```

- You can remove `-d` or `--detach` from the command to see the output on the console. The flag detaches the command and releases the console after the command has been executed.
- Please note that passing the localtime and timezone within the volumes of each container in the `docker-compose.yml` is completely optional and can only be used if you use this `docker-compose.yml` in a unix-like system.
- On a Docker Swarm system you can use `SPRING_KEYCLOAK_CLIENT_SECRET__FILE` instead of `SPRING_KEYCLOAK_CLIENT_SECRET` which reads sensitive from files

You now have an up and running minimal system consisting of a PostgreSQL Database, Keycloak and ACE.

Here are the credentials and interfaces for testing.:

**ACE: [http://localhost:808/api/pseudonymization](http://localhost:8080/api/pseudonymization)**

**Keycloak Frontend: [http://localhost:8081/](http://localhost:8081/)**

| Type          | Value       |
| ------------- | ----------- |
| Adminusername | admin       |
| Adminpassword | admin       |
| Testusername  | test        |
| Testpassword  | test        |

**PostgreSQL**

| Type           | Value             |
| -------------- | ----------------- |
| IP             | `localhost`       |
| Port           | 5432              |
| Superuser (SU) | ace-manager       |
| SU-Password    | ps3udoNym1zation! |

You are no able to play around with the system and do some things like [creating users in Keycloak](/guides/keycloak/user/), [requesting an access token from Keycloak](/getting-started/getting-access/) and doing [your first request](/getting-started/first-request/).

If you want to stop everthing. Run the following command.
```shell title="Stop everthing"
docker compose --project-name ace --file docker-compose.yml stop
```
This will stop but not remove the containers or volumes.
