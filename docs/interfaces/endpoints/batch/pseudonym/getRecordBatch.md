---
glightbox: false
---

# `GET` /domains/{domain}/pseudonyms/batch

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `record-read-batch`
    - The name of the domain to read the records from
    - (optional) `complete-view`

## Description
This method retrieves a list of reduced viewed pseudonym-records in a pseudo-batch. A requester can see everything if the permission `complete-view` is applied.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter
| Name/Key                                            | Details            | In   | Required         | Inheritable      | When not given  | Example                                                              |
|-----------------------------------------------------|--------------------|------|------------------|------------------|-----------------|----------------------------------------------------------------------|
| domain                                              | Name of the domain | Path | :material-check: | :material-close: | 400 BAD REQUEST | testDomain                                                           |

## Return values

| Status | Name | Triggering Event                      |
|--------|------|---------------------------------------|
| 200    | OK   | The list of record when it was found. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"



## Example Request

In this example we just want to simply get a list of all records in the domain `TestStudie`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/readRecordBatch/curl-request.sh"
```

```json title="Successful (200 Ok) Reponse Content"
--8<-- "docs/assets/snippets/interface/readRecordBatch/response-body.json"
```