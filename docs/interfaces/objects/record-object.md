---
glightbox: false
---

# Record Object

## Fields

| Name/Key                                                                            | Details                                                                  | Inheritable      | Default Value | Example                                                                                                |
|-------------------------------------------------------------------------------------|--------------------------------------------------------------------------|------------------|---------------|--------------------------------------------------------------------------------------------------------|
| [algo](/interfaces/objects/record-object/#pseudonymization-algorithm)          | Algorithm that should be used for creating the pseudonyms in the domain. | :material-check: | MD5           | MD5                                                                                                    |
| domain                                                                              | [Domain Object](/objects/domain-object/)                            | :material-close: |               | [Domain Object](/interfaces/objects/domain-object/)                                               |
| id                                                                                  | Plain identifier                                                         | :material-close: |               | 960812MT4                                                                                              |
| idType                                                                              | Type of identifier                                                       | :material-close: |               | SSN                                                                                                    |
| psn                                                                                 | plain pseudonym to use for the identifier                                | :material-close: |               | TD-00664422                                                                                            |
| [validityTime](/interfaces/objects/record-object/#user-friendly-validity-time) | Validity period of a domain/record                                       | :material-check: |               | 1 week, 3weeks, 7d, 2 days, 8 years, 30y, 12h, 24 hours, 1min, 10 minutes, 2m, 500 sec, 60seconds, ... |
| validFrom                                                                           | Start date (and time) of the validity period of a domain/record          | :material-check: |               | 2022-01-01 00:00:00.00                                                                                 |
| validTo                                                                             | End date (and time) of the validity period of a domain/record            | :material-check: |               | 2022-12-31 23:59:59.99                                                                                 |

## Examples

### Complete Version

#### Request Complete Object

```json title="JSON Request Reprensentation"
--8<-- "docs/assets/snippets/example/record-request-example.json"
```

#### Response Complete Object

```json title="JSON Response Reprensentation"
--8<-- "docs/assets/snippets/example/record-response-example.json"
```

```text title="Plain Reprensentation"
TBA 
```

### Reduced Version

#### Request Reduced Object

```json title="JSON Request Reprensentation"
--8<-- "docs/assets/snippets/example/record-reduced-request-example.json"
```

#### Response Reduced Object

```json title="JSON Reprensentation"
--8<-- "docs/assets/snippets/example/record-reduced-response-example.json"
```

```text title="Plain Reprensentation"
TBA 
```

### Pseudonymization Algorithm

--8<-- "docs/assets/snippets/pseudonymization-algorithms.snippet"

### User-friendly Validity Time

--8<-- "docs/assets/snippets/validity-time.snippet"