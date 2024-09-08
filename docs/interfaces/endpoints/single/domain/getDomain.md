---
glightbox: false
---

# `GET` /domain

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `domain-read`
    - The name of the domain you want to read
    - (optional) `complete-view`

## Description
This endpoint returns a domain for the given name in a reduced view. A requester can see everything if the permission `complete-view` is applied.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter
| Name/Key | Details            | In    | Required         | When not given | Example    |
|----------|--------------------|-------|------------------|----------------|------------|
| name     | Name of the domain | Query | :material-check: | 400 BAD REQUEST| testDomain |

## Return values

| Status | Name | Triggering Event                                                |
|--------|------|-----------------------------------------------------------------|
| 200    | OK   | [Domain](/interfaces/objects/domain-object/) is responded. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"


## Example Request

In this example we just want to simply get a domain called `TestStudie`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/readDomain/curl-request.sh"
```

```json title="Successful (200 Ok) Reponse Content"
--8<-- "docs/assets/snippets/interface/readDomain/response-body.json"
```
