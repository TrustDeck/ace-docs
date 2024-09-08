curl 'http://localhost:8080/api/pseudonymization/domains/TestStudie/pseudonyms/batch' -i -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '[ {
  "id" : "10000008913",
  "idType" : "ANY-ID",
  "psn" : "",
  "validFromInherited" : true,
  "validToInherited" : true
}, {
  "id" : "10000008914",
  "idType" : "ANY-ID",
  "psn" : "",
  "validFromInherited" : true,
  "validToInherited" : true
  }]