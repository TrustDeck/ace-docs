---
glightbox: false
---

# `DELETE` /domain

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `domain-delete`
    - The name of the domain you want to delete

## Description
This endpoint deletes a domain for the given parameters.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter
| Name/Key  | Details                                            | In    | Required         | When not given          | Example     |
|-----------|----------------------------------------------------|-------|------------------|-------------------------|-------------|
| name      | Name of the domain                                 | Query | :material-check: | 400 BAD_REQUEST         | testDomain  |
| recursive | Specifies whether to delete the underlying domains | Query | :material-close: | Default (False) is used | True, False |

## Return values

| Status | Name       | Triggering Event                              |
|--------|------------|-----------------------------------------------|
| 204    | NO CONTENT | Deletion was successfully. No Content needed. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

## Example Request

In this example we just want to simply delete a domain called `TestStudie`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/deleteDomain/curl-request.sh"
```

```json title="Successful (204 No Content) Reponse Content"
--8<-- "docs/assets/files/204-no_content.json"
```