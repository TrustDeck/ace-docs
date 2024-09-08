---
glightbox: false
---

# `POST` /domains/{domain}/pseudonyms

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `record-create`
    - The name of the domain in which the record should be created
    - (optional) `complete-view`

## Description

This endpoint creates a new record in the given domain for the given parameter. A requester can see everything if the permission `complete-view` is applied. If not the returned object is reduced.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter

| Name/Key                                                 | Details                                                               | In    | Required         | When not given  | Example                                                           |
|----------------------------------------------------------|-----------------------------------------------------------------------|-------|------------------|-----------------|-------------------------------------------------------------------|
| [Record Object](/interfaces/objects/record-object/) | The reduced record object to create.                                  | Body  | :material-check: | 400 BAD REQUEST | [Record Object](/interfaces/objects/record-object/#examples) |
| omitPrefix                                               | Determines whether or not the prefix should be added to the pseudonym | Query | :material-close: | False           | true                                                              |

## Return values



| Status | Name    | Triggering Event                       |
|--------|---------|----------------------------------------|
| 200    | OK      | The record is already in the database. |
| 201    | CREATED | The record was created successfully.   |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"


## Example Request

In this example we just want to simply create a new record in the domain `TestStudie` for a given `id` and `idType`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/createRecord/curl-request.sh"
```

```json title="Successful (201 Created) Reponse Content"
--8<-- "docs/assets/snippets/interface/createRecord/response-body.json"
```