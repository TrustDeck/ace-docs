---
glightbox: false
---

# ACE Configuration

## Nativ

This configuration contains settings that you can start with. We use it for example in development.
Create a file `application.yml` and copy/paste the following content into it.

--8<-- "docs/assets/snippets/remember-configure.snippet"

```yaml title="Example Configuration with comments"
--8<-- "docs/assets/files/application.yml"
```

## Docker

All environments are ready to use as a docker secret by adding a suffix `__FILE` to each variable.
For example: `SPRING_DATASOURCE_PASSWORD` becomes `SPRING_DATASOURCE_PASSWORD__FILE`.

!!! warning "Currently no environment has a default value for docker. This might change in the future."

| ENV                                  | Details                                                     | Required | Example               |
| ------------------------------------ | ----------------------------------------------------------- | -------- | --------------------- |
| SPRING_DATASOURCE_NAME               | The name of the database                                    | yes      | pseudonymization      |
| SPRING_DATASOURCE_HOST               | The host address of the PostgreSQL database                 | yes      | 127.0.0.1             |
| SPRING_DATASOURCE_PORT               | The port of the PostgreSQL database                         | yes      | 5432                  |
| SPRING_DATASOURCE_USERNAME           | The username of the database                                | yes      | postgres              |
| SPRING_DATASOURCE_PASSWORD           | The username of the database                                | yes      | 1234556               |
| SPRING_DATASOURCE_MAX_POOLSIZE       | The maximum poolsize for connections                        | yes      | 20                    |
| SPRING_DATASOURCE_CONNECTION_TIMEOUT | The connection timeout in milliseconds                      | yes      | 3000                  |
| SPRING_KEYCLOAK_REALM                | The realm of Keycloak                                       | yes      | development           |
| SPRING_KEYCLOAK_AUTH_SERVER_URL      | The url of Keycloak without `/auth` since Keycloak 17       | yes      | http://localhost:8081 |
| SPRING_KEYCLOAK_CLIENT_ID            | The client id from Keycloak                                 | yes      | ace                   |
| SPRING_KEYCLOAK_CLIENT_SECRET        | The client secret from Keycloak                             | yes      | 1234-5678-9012        |
| SPRING_GROUP_MAPPER_NAME             | The name of the mapper there the groups are getting claimed | yes      | groups                |
| SPRING_LOG_LEVEL                     | The generel log level                                       | yes      | INFO                  |

!!! note "Regarding `SPRING_GROUP_MAPPER_NAME`"

    Please note. The following group names cannot be changed in the Docker setup at this time.
    They are currently hard-coded.

    ```yml title=""
    isHuman: Human
    isTechnical: Technical
    isNoAuditing: Unaudited
    isAuditEverything: AuditEverything
    ```
