---
glightbox: false
---

# `PUT` /domains/{domain}/salt

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `domain-update-salt`
    - The name of the domain you want to update the salt

## Description
This endpoint updates the salt in a domain for the given parameter.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter
| Name/Key | Details            | In    | Required         | When not given  | Example         |
|----------|--------------------|-------|------------------|-----------------|-----------------|
| domain   | Name of the domain | Path  | :material-check: | 400 BAD REQUEST | testDomain      |
| salt     | The new salt       | Query | :material-check: | 400 BAD REQUEST | fkT0E+2bfgAhjA4 |

## Return values

| Status | Name | Triggering Event                |
|--------|------|---------------------------------|
| 200    | OK   | Salt of domain as plain string. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

## Example Request

In this example we just want to simply update the salt from the domain called `TestStudie`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/updateSalt/curl-request.sh"
```

```json title="Successful (200 Ok) Reponse Content"
--8<-- "docs/assets/files/200-ok.json"
```