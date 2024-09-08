---
glightbox: false
---

# `POST` /domain/complete

--8<-- "docs/assets/snippets/permission-hint.snippet"

    - `domain-create-complete`
    - The name of the domain you want to create

## Description

This endpoint creates a new domain from all possible given parameters.

**Optional enforcement of validity period dates:** 

Since the validity of records and domains is solely defined and
managed via their validity periods, there is an option to enforce both the start and end date of a record to be within
the constraints imposed by its associated domain. Turning this option on for the start date will enforce the start date
of the record’s validity period to be after (or equal to) the start date of the domain’s validity period. Analogously,
turning this option on for the end date will enforce the end date of the record’s validity period to be before (or equal
to) the end date of the domain’s validity period. In practice, the service will set the start date of its validity
period to the start date of its associated domain, if a violation of this constraint during record creation is
encountered. Analogously, the service will set the end date of its validity period to the end date of its associated
domain, if it would otherwise violate the enforcement constraint. This option is tracked in each domain individually for
the start date and the end date. This option is inheritable and is taken into account when updating the record's
validity start and end dates.

## Headers

--8<-- "docs/assets/snippets/endpoint-headers.snippet"

## Parameter

| Name/Key                                          | Details                      | In   | Required         | When not given  | Example                                                    |
|---------------------------------------------------|------------------------------|------|------------------|-----------------|------------------------------------------------------------|
| [Domain](/interfaces/objects/domain-object/) | The domain object to create. | Body | :material-check: | 400 BAD REQUEST | [Domain](/interfaces/objects/domain-object/#examples) |

## Return values

| Status | Name    | Triggering Event                             |
|--------|---------|----------------------------------------------|
| 200    | OK      | If the domain was already in the database.   |
| 201    | CREATED | If the domain has been successfully created. |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

## Example Request

In this example we just want to simply create a new domain called `WeitereStudieComplete` with a prefix `WS-`.

--8<-- "docs/assets/snippets/remember-access-token.snippet"

```shell title="Example Request with curl"
--8<-- "docs/assets/snippets/interface/createDomainComplete/curl-request.sh"
```

```json title="Successful (201 Created) Reponse Content"
--8<-- "docs/assets/files/201-created.json"
```
