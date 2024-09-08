curl 'http://localhost:8080/api/pseudonymization/domains/TestStudie/pseudonyms/complete?psn=TS-9EEEE39F0D5C03507CB9388609E925F9' -i -X PUT \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '{
  "idType" : "OTHER-ID"
  }'