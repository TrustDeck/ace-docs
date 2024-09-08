---
glightbox: false
---

# `DELETE` /domains/{domain}/pseudonyms/batch

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `record-delete-batch`
    - The name of the domain to delete the records from

## Description
This method deletes all records in the given domain.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter
| Name/Key                                                   | Details            | In   | Required         | When not given  | Example                                                              |
|------------------------------------------------------------|--------------------|------|------------------|-----------------|----------------------------------------------------------------------|
| domain                                                     | Name of the domain | Path | :material-check: | 400 BAD REQUEST | testDomain                                                           |

## Return values

| Status | Name | Triggering Event                |
|--------|------|---------------------------------|
| 200    | OK   | The List of the created record. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

## Example Request

In this example we just want to simply delete records in the domain `TestStudie` for the given list.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/deleteRecordBatch/curl-request.sh"
```

```json title="Successful (204 No Content) Reponse Content"
--8<-- "docs/assets/files/204-no_content.json"
```