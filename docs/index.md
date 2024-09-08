---
glightbox: false
---



# ACE - Advanced Confidentiality Engine

!!! success "A blazing fast, lightweight, extensive, easy-to-use and secure pseudonymization service"

The service uses Spring Boot, jOOQ, HikariCP, Keycloak and a PostgreSQL Database.
This pseudonymization service was created because we couldn't find a tool which fitted our needs. Some of those requirements are described in the feature section below.

## Features and Requirements

- [x] Open Source and based on widespread common open source solutions
- [x] Cross-Platform and available for Linux, macOS and Windows as well as Docker.
- [x] High performance optimized
- [x] Accurate and transparent high-performance tests
- [x] Well documented with pragmatic examples
- [x] Various pseudonym interactions
    - [x] CRUD-Interfaces for managing pseudonyms
    - [x] Stores validity time periods
    - [x] Updatable connections between pseudonyms
- [x] Various domain interactions
    - [x] CRUD-Interface for managing domains
    - [x] Stores and Generates One Salt per Domain
- [x] Default audit trail
    - [x] decides between human and/or technical requester
- [x] Easy to deploy
- [x] Stable and lightweight architecture
    - [x] LTS for endpoints
    - [x] Modern REST-API microservice interface which returns a JSON or plain text
- [x] Permission check on each endpoint for every requester
    - [x] Adjustable output based on roles

## Releases

- Docker Images TBA
- [Source Code Versions](https://github.com/TrustDeck/ace/tags)

## Contributions

Unless you explicitly state otherwise, any contribution intentionally submitted for inclusion in current work by you, as defined in the Apache-2.0 license, shall be dual licensed as described below, without any additional terms or conditions.

Feel free to send a pull request or file an issue.

## License

This work is distributed under the terms of the Apache License (Version 2.0).
