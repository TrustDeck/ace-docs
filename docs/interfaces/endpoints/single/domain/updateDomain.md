---
glightbox: false
---

# `PUT` /domain

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `domain-update`
    - The name of the domain you want to update

## Description
This endpoint updates a range from all possible given parameters **without making recursive changes**.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter
| Name/Key                                                                   | Details                                                                  | In    | Required         | When not given    | Example                                                    |
|----------------------------------------------------------------------------|--------------------------------------------------------------------------|-------|------------------|-------------------|------------------------------------------------------------|
| [algo](/interfaces/objects/domain-object/#pseudonymization-algorithm) | Algorithm that should be used for creating the pseudonyms in the domain. | Query | :material-close: | Old value is used | MD5                                                        |
| name                                                                       | Name of the current used domain                                          | Query | :material-check: | 400 BAD REQUEST   | testDomain                                                 |
| [Domain](/interfaces/objects/domain-object/)                          | The domain object with values to update.                                 | Body  | :material-check: | 400 BAD REQUEST   | [Domain](/interfaces/objects/domain-object/#examples) |

## Return values
| Status | Name | Triggering Event                             |
|--------|------|----------------------------------------------|
| 200    | OK   | If the domain has been successfully updated. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"


## Example Request

In this example we have updated the `validFrom` time. If you specify values that are 100% the same, they are not updated.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/updateDomain/curl-request.sh"
```

```json title="Successful (200 Ok) Reponse Content"
--8<-- "docs/assets/files/200-ok.json"
```