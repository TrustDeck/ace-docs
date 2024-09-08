---
glightbox: false
---

# `DELETE` /domains/{domain}/pseudonyms

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `record-delete`
    - The name of the domain to delete the record from

## Description
This endpoint returns the record from the database for the given parameter.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter

Either the combination id and idType or psn need to be given.

| Name/Key | Details                                   | In    | Required         | When not given       | Example      |
|----------|-------------------------------------------|-------|------------------|----------------------|--------------|
| domain   | Name of the domain                        | Path  | :material-check: | 400 BAD REQUEST      | testDomain   |
| id       | Plain identifier                          | Query | :material-close: | psn is used          | 100808       |
| idType   | Type of identifier                        | Query | :material-close: | psn is used          | KGV-Nr       |
| psn      | plain pseudonym to use for the identifier | Query | :material-close: | id & idType are used | TST-00329564 |

## Return values

| Status | Name       | Triggering Event                  |
|--------|------------|-----------------------------------|
| 204    | NO CONTENT | When the deletion was successful. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"


## Example Request

In this example we just want to simply delete a record from domain `TestStudie` for a given `psn`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/deleteRecord/curl-request.sh"
```

```json title="Successful (204 No Content) Reponse Content"
--8<-- "docs/assets/files/204-no_content.json"
```