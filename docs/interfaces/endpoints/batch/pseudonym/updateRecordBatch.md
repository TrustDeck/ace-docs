---
glightbox: false
---

# `PUT` /domains/{domain}/pseudonyms/batch

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `record-update-batch`
    - The name of the domain in which the records should be created

## Description
This method updates a list of pseudonym-records in a batch. Every list entry must contain all necessary information (identifier, idType, pseudonym, validFrom, validFromInherited, validTo, validToInherited).

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter
| Name/Key                                                  | Details            | In   | Required         | Inheritable      | When not given  | Example                                                                      |
|-----------------------------------------------------------|--------------------|------|------------------|------------------|-----------------|------------------------------------------------------------------------------|
| domain                                                    | Name of the domain | Path | :material-check: | :material-close: | 400 BAD REQUEST | testDomain                                                                   |
| [Record Objects](/interfaces/objects/record-object/) | A list of Records  | Body | :material-check: | :material-close: | 400 BAD REQUEST | [A list of Record Objects](/interfaces/objects/record-object/#examples) |


## Return values

| Status | Name | Triggering Event |
|--------|------|------------------|
| 200    | OK   | Empty Content.   |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

## Example Request

In this example we just want to simply create new records in the domain `TestStudieX` for the given list.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/updateRecordBatch/curl-request.sh"
```

```json title="Successful (200 Ok) Reponse Content"
--8<-- "docs/assets/files/200-ok.json"
```