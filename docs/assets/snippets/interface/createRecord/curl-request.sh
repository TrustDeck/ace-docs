curl 'http://localhost:8080/api/pseudonymization/domains/TestStudie/pseudonyms' -i -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '{
  "id" : "1234356",
  "idType" : "MP-ID"
  }'