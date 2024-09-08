---
glightbox: false
---

# `GET` /experimental/domains/hierarchy

!!! danger "Experimental Endpoint"

    An experimental API is one which is planned for eventual public availability, but is subject to further experimentation, testing, and discussion. Please note that we expect the endpoint definitions to change.

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `domain-list-all`
    - (optional) `complete-view`

## Description
This method returns all domains from the database in a reduced version with id, name and superdomain. A requester can see everything if the permission `complete-view` is applied.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter
There are currently no parameters

## Return values
| Status | Name | Triggering Event                                                                                     |
|--------|------|------------------------------------------------------------------------------------------------------|
| 200    | OK   | [List of Domain Objects](/interfaces/objects/domain-object/) are responded in a minimal version |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

## Example Request

In this example we just want to simply get a list of all domains.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/listDomainHierarchy/curl-request.sh"
```

```json title="Successful (200 Ok) Reponse Content"
--8<-- "docs/assets/snippets/interface/listDomainHierarchy/response-body.json"
```
