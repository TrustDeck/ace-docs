---
glightbox: false
---

# Your first Requests

--8<-- "docs/assets/snippets/testing-only-purposes.snippet"

--8<-- "docs/assets/snippets/remember-access-token.snippet"

## Create a domain
```shell title="Create a domain"
--8<-- "docs/assets/snippets/interface/createDomain/curl-request.sh"
```
This should [create a new domain through the interface](/interfaces/endpoints/single/domain/createDomain/) with the specified domain name.

The response should look like this:
```json title="Successful (201 Created) Reponse Content"
{
  "statusCode": "201",
  "statusMessage": "Created"
}
```

You successfully created a new domain! :partying_face: 

## Read a domain

We now want to request this domain. To do so, we use the following command, which queries the respective [interface to get the domain](/interfaces/endpoints/single/domain/getDomain/).

```shell title="Get the domain"
--8<-- "docs/assets/snippets/interface/readDomain/curl-request.sh"
```

!!! tip "To check your data in the database with a GUI, you can use [pgAdmin 4](https://www.pgadmin.org/download/)"

The response should look like this:
```json title="Successful (200 Ok) Reponse Content"
--8<-- "docs/assets/snippets/interface/readDomain/response-body.json"
```
You have successfully obtained the domain! :star_struck: 

You are now able to use all our interfaces. Just try them out. 

## Easy Reset

You can reset the entire database used by ace with the following commands if you want to start from scratch. 
Have fun testing!

1. Drop the old database
2. Create a new empty database
3. Change the owner of the new database
4. Restore schema and data

```shell title="Commands for the reset"
docker exec -i ace-postgresql /bin/bash -c "PGPASSWORD=ps3udoNym1zation! psql --username ace-manager postgres -c 'DROP DATABASE ace WITH (FORCE);'"
docker exec -i ace-postgresql /bin/bash -c "PGPASSWORD=ps3udoNym1zation! psql --username ace-manager postgres -c 'CREATE DATABASE ace;'"
docker exec -i ace-postgresql /bin/bash -c "PGPASSWORD=ps3udoNym1zation! psql --username ace-manager postgres -c 'ALTER DATABASE ace OWNER TO \"ace-manager\";'"
docker exec -i ace-postgresql /bin/bash -c "PGPASSWORD=ps3udoNym1zation! psql --username ace-manager ace" < docs/assets/examples/db/ace-schema.sql
```

