---
glightbox: false
---

# `POST` /domain

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `domain-create`

## Description

This endpoint creates a new domain for a small list of given parameters.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter

| Name/Key                                          | Details                      | In   | Required         | When not given  | Example                                                    |
|---------------------------------------------------|------------------------------|------|------------------|-----------------|------------------------------------------------------------|
| [Domain](/interfaces/objects/domain-object/) | The domain object to create. | Body | :material-check: | 400 BAD REQUEST | [Domain](/interfaces/objects/domain-object/#examples) |

## Return values

| Status | Name    | Triggering Event                             |
|--------|---------|----------------------------------------------|
| 200    | OK      | If the domain was already in the database.   |
| 201    | CREATED | If the domain has been successfully created. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

## Example Request

In this example we just want to simply create a new domain called `TestStudie` with a prefix `TS-`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/createDomain/curl-request.sh"
```

```json title="Successful (201 Created) Reponse Content"
--8<-- "docs/assets/files/201-created.json"
```
