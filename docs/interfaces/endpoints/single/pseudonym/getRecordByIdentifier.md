---
glightbox: false
---

# `GET` /domains/{domain}/pseudonyms

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `record-read`
    - The name of the domain to read the record from
    - (optional) `complete-view`

## Description
This endpoint returns the record from the database for the given parameter. A requester can see everything if the permission `complete-view` is applied. If not the returned object is reduced.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter

Either the combination id and idType or psn need to be given.

| Name/Key | Details                                   | In    | Required         | When not given       | Example      |
|----------|-------------------------------------------|-------|------------------|----------------------|--------------|
| domain   | Name of the domain                        | Path  | :material-check: | 400 BAD REQUEST      | testDomain   |
| id       | Plain identifier                          | Query | :material-close: | 400 BAD REQUEST          | 100808       |
| idType   | Type of identifier                        | Query | :material-close: | 400 BAD REQUEST          | KGV-Nr       |

## Return values

| Status | Name | Triggering Event                             |
|--------|------|----------------------------------------------|
| 200    | OK   | The record when it was found. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"


## Example Request

In this example we just want to simply request a record from domain `TestStudie` for a given `id` and `idType`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"


```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/readRecordByIdentifier/curl-request.sh"
```

```json title="Successful (200 Ok) Reponse Content"
--8<-- "docs/assets/snippets/interface/readRecordByIdentifier/response-body.json"
```