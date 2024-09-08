curl 'http://localhost:8080/api/pseudonymization/domains/TestStudie/pseudonyms?idType=ANY-ID&id=10000008912' -i -X PUT \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '{"validFrom" : "2023-08-04T09:56:14.77354"}'