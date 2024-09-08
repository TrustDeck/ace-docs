curl 'http://localhost:8080/api/pseudonymization/domain/complete' -i -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '{
  "name" : "WeitereStudieComplete",
  "prefix" : "WS-"
  }'