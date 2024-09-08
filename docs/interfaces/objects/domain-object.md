---
glightbox: false
---

# Domain Object

## Fields

| Name/Key                                                                            | Details                                                                                                                  | Inheritable      | Default Value                                                                 | Example                                                                    |
|-------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|------------------|-------------------------------------------------------------------------------|----------------------------------------------------------------------------|
| [algorithm](/interfaces/objects/domain-object/#pseudonymization-algorithm)     | Algorithm that should be used for creating the pseudonyms in the domain.                                                 | :material-check: | MD5                                                                           | MD5                                                                        |
| description                                                                         | Description of the domain.                                                                                               | :material-close: |                                                                               | This is a test.                                                            |
| name                                                                                | Name of the domain                                                                                                       | :material-close: |                                                                               | testDomain                                                                 |
| superDomainName                                                                     | Name of the parent domain                                                                                                | :material-close: |                                                                               | testDomain                                                                 |
| prefix                                                                              | Prefix for pseudonyms inside the domains                                                                                 | :material-close: |                                                                               | TST-, tD1-                                                                 |
| validFrom                                                                           | Start date (and time) of the validity period of a domain/record                                                          | :material-check: | creation time                                                                 | 2022-01-01 00:00:00.00                                                     |
| enforceStartDateValidity                                                            | Whether or not the valid-from date should be forced to be "inside" the validity period defined by the associated domain. | :material-check: | True                                                                          | True, False                                                                |
| validTo                                                                             | End date (and time) of the validity period of a domain/record                                                            | :material-check: | Value from parent [domain](/interfaces/objects/domain-object/) or nothing | 2022-12-31 23:59:59.99                                                     |
| enforceEndDateValidity                                                              | Whether or not the valid-to date should be forced to be "inside" the validity period defined by the associated domain.   | :material-check: | True                                                                          | True, False                                                                |
| [validityTime](/interfaces/objects/domain-object/#user-friendly-validity-time) | The validity period of a domain/record                                                                                   | :material-check:                                                                               | 8 years, 30y, 12h, 24 hours, 1min, 10 minutes, 2m, 500 sec, 60seconds, ... |
| paddingCharacter                                                                    | The character that should be used for padding the pseudonyms to a certain length if necessary                            | :material-close: |                                                                               | 0                                                                          |
| pseudonymLength                                                                     | The length that the pseudonyms should have (excluding the prefix and dash)                                               | :material-close: |                                                                               | 8                                                                          |
| consecValCtr                                                                        | The initial number used for the consecutive numbering pseudonymization algorithm                                         | :material-close: | 1L                                                                            | 2                                                                          |
| salt                                                                                | A new salt. Note You can only use the Salt on an update not a create request.                                            | :material-close: |                                                                               | fkT0E+2bfgAhjA4                                                            |
| saltLength                                                                          | Length of Salt. Minimum is 32. Maximum is 256.                                                                           | :material-close: | 32                                                                            | 8                                                                          |

## Examples

### Complete Version

#### Request Complete Object

!!! note "The salt field is only available on an update request"

```json title="JSON Request Reprensentation"
--8<-- "docs/assets/snippets/example/domain-request-example.json"
```

#### Response Complete Object

```json title="JSON Response Reprensentation"
--8<-- "docs/assets/snippets/example/domain-response-example.json"
```

```text title="Plain Reprensentation"
TBA 
```

### Reduced Version

#### Request Reduced Object

!!! note "The salt field is only available on complete update request or explicit update salt request"

```json title="JSON Request Reprensentation"
--8<-- "docs/assets/snippets/example/domain-reduced-request-example.json"
```

#### Response Reduced Object

```json title="JSON Response Reprensentation"
--8<-- "docs/assets/snippets/example/domain-reduced-reponse-example.json"
```

```text title="Plain Reprensentation"
TBA 
```

### Pseudonymization Algorithm

--8<-- "docs/assets/snippets/pseudonymization-algorithms.snippet"

### User-friendly Validity Time

--8<-- "docs/assets/snippets/validity-time.snippet"
