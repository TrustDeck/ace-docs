---
glightbox: false
---

# `GET` /domains/{domain}/salt

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `domain-read-salt`
    - The name of the domain you want to read the salt

## Description
This endpoint returns the salt from a domain for the given parameter.

## Headers
No additional headers currently supported.

## Parameter
| Name/Key | Details            | In   | Required         | When not given  | Example    |
|----------|--------------------|------|------------------|-----------------|------------|
| domain   | Name of the domain | Path | :material-check: | 400 BAD REQUEST | testDomain |

## Return values

| Status | Name | Triggering Event                |
|--------|------|---------------------------------|
| 200    | OK   | Salt of domain as plain string. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

## Example Request

In this example we just want to simply get the salt from the domain called `TestStudie`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/readSalt/curl-request.sh"
```

```text title="Successful (200 Ok) Reponse Content"
--8<-- "docs/assets/snippets/interface/readSalt/response-body.json"
```