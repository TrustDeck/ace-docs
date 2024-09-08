---
glightbox: false
---

# Roles

In ACE following functional roles exists, which allow a fine-granulated authorization management using keycloak.
In addition to the functional role the respective user **must also** possess the role of the respective domain name in keycloak.

| Role name              | Grant priviliges to …                                                       |
| ---------------------- | --------------------------------------------------------------------------- |
| domain-create          | Create a new domain with a reduced set of attributes                        |
| domain-create-complete | Create a new domain with all attributes                                     |
| domain-delete          | Delete a domain                                                             |
| domain-list-all        | List all domains from the database in a minimal version                     |
| domain-read            | Read a domain                                                               |
| domain-read-salt       | Read the salt of a domain                                                   |
| domain-update          | Update a domain with a reduced set of updatable attributes                  |
| domain-update-complete | Update a domain with all updatable attributes                               |
| domain-update-salt     | Update the salt of a domain                                                 |
| record-create          | Create a new pseudonymization record                                        |
| record-create-batch    | Create new pseudonymization-records in batches                              |
| record-delete          | Delete a pseudonymization record                                            |
| record-delete-batch    | Delete pseudonymization-records in batches                                  |
| record-read            | Read a pseudonymization record                                              |
| record-read-batch      | Read pseudonymization-records in batches                                    |
| record-update          | Update a pseudonymization record with a reduced set of updatable attributes |
| record-update-complete | Update a pseudonymization record with all attributes                        |
| record-update-batch    | Update pseudonymization-records in batches                                  |
| complete-view          | Allows to access the complete view on an object                             |
| link-pseudonyms        | Allows to link pseudonyms in different domains.                             |

## Domain-Role-Relationship

To ensure that a requester can only request objects with the corresponding roles. We have introduced a relationship between domain and roles. We do this simply by following a consistent group path.
For example, a user must be a member of the group `domain-read` and `TestStudie`, which is a child of `domain-read`. This creates the path `domain-read/TestStudie`, which ensures that the domain `TestStudie` can be read.
