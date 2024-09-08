curl 'http://localhost:8080/api/pseudonymization/domains/TestStudie/pseudonyms?psn=TS-9EEEE39F0D5C03507CB9388609E925F9' -i -X PUT \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '{
  "validFrom" : "2023-08-04T09:56:14.887102"
  }'