---
glightbox: false
---

# `PUT` /domains/{domain}/pseudonyms/complete

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `record-update-complete`
    - The name of the domain in which the record is updated

## Description

This endpoint updates a record in the domain from a list of given parameters. Updates the record where the
identifier, identifier type and domain matches.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter
| Name/Key                                      | Details                              | In    | Required         | When not given  | Example                                                               |
|-----------------------------------------------|--------------------------------------|-------|------------------|-----------------|-----------------------------------------------------------------------|
| domain                                        | Name of the domain                   | Path  | :material-check: | 400 BAD REQUEST | testDomain                                                            |
| id                                            | Plain identifier                     | Query | :material-check: | 400 BAD REQUEST | 960812MT4                                                             |
| idType                                        | Type of identifier                   | Query | :material-check: | 400 BAD REQUEST | SSN                                                                   |
| [Record Object](/interfaces/objects/record-object/) | The reduced record object to update. | Body  | :material-check: | 400 BAD REQUEST | [Record Object](/interfaces/objects/record-object/#examples) |

## Return values

| Status | Name | Triggering Event                             |
|--------|------|----------------------------------------------|
| 200    | OK   | The record of the updated record on success. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

## Example Request

In this example we just want to simply update the record in the domain `TestStudie` for a given `id` and `idType`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/updateRecordCompleteByIdentifier/curl-request.sh"
```

```json title="Successful (200 Created) Reponse Content"
--8<-- "docs/assets/snippets/interface/updateRecordCompleteByIdentifier/response-body.json"
```