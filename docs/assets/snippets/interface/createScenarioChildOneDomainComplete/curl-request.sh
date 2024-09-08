curl 'http://localhost:8080/api/pseudonymization/domain' -i -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '{
  "name" : "ProjectX-Labor",
  "prefix" : "PX-L-",
  "superDomainName" : "ProjectX"
  }'