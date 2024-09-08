---
glightbox: false
---

# `POST` /domains/{domain}/pseudonyms/batch

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `record-create-batch`
    - The name of the domain in which the records should be created
    - (optional) `complete-view`

## Description

This method creates new pseudonymization-records in batches. When an external created pseudonym is given, no new
pseudonym is created but the given one is stored. A requester can see everything if the permission `complete-view` is applied.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter

| Name/Key                                                  | Details                                                               | In    | Required         | When not given            | Example                                                                      |
|-----------------------------------------------------------|-----------------------------------------------------------------------|-------|------------------|---------------------------|------------------------------------------------------------------------------|
| domain                                                    | Name of the domain                                                    | Path  | :material-check: | 400 BAD REQUEST           | testDomain                                                                   |
| [Record Objects](/interfaces/objects/record-object/) | A list of Records                                                     | Body  | :material-check: | 400 BAD REQUEST           | [A list of Record Objects](/interfaces/objects/record-object/#examples) |
| omitPrefix                                                | Determines whether or not the prefix should be added to the pseudonym | Query | :material-close: | Default is taken: `false` | true                                                                         |

## Return values

| Status | Name    | Triggering Event                |
|--------|---------|---------------------------------|
| 201    | CREATED | The List of the created record. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"


## Example Request

In this example we just want create records in the domain `TestStudie` for the given list.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/createRecordBatch/curl-request.sh"
```

```json title="Successful (201 Created) Reponse Content"
--8<-- "docs/assets/snippets/interface/createRecordBatch/response-body.json"
```