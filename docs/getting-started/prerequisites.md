---
glightbox: false
---

# Prerequisites

## In Production

- [PostgreSQL version 16.X](https://www.postgresql.org/download/)
- [Keycloak version 25.X or higher](https://www.keycloak.org/)

| Native                                                                             | Docker                                                                                                                                                                         |
| ---------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Installation of [Java version 21](https://oracle.com/java/technologies/downloads/) | At least an I Installation of [Docker Engine 27.X](https://docker.com/get-started) or higher. <br/>For installation of docker, see [this](https://docs.docker.com/get-docker/) |

## In Development

In addition to the requirements for a productive system, you might need the following additional software.

| Software                                                                | Description                                                                                                               | required ? |
| ----------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------- | ---------- |
| [Docker Desktop](https://docs.docker.com/desktop/)                      | Simplifies the work with docker                                                                                           | No         |
| [Maven](https://maven.apache.org/download.cgi)                          | **is needed to build the service** and should shift automatically together with Java but can be installed separately too. | yes        |
| [Python 3.X](https://www.python.org/downloads/)                         | if you want to extend the docs and migration                                                                              | no         |
| [IDE](https://en.wikipedia.org/wiki/Integrated_development_environment) | for example [IntelliJ IDEA](https://www.jetbrains.com/idea/)                                                              | yes        |
| [Project Lombock](https://projectlombok.org/)                           | Creates automatic getters and setters (Should shift then installing this software with maven)                             | no         |
| [pgAdmin](https://www.pgadmin.org/download/)                                             | GUI for PostgreSQL                                                                                                        | no         |
| [Postman](https://www.postman.com/downloads/)                           | For testing **if you do not use JUnit**                                                                                   | no         |
| [Node.js latest](https://nodejs.org/en/download/)                       | For testing **if you do not use JUnit and using postman**                                                                 | no         |
| [git](https://git-scm.com/)                                             | Version control                                                                                                           | yes        |
