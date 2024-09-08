curl 'http://localhost:8080/api/pseudonymization/domains/TestStudie/pseudonyms/batch' -i -X PUT \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '[ {
  "id" : "10000008913",
  "idType" : "ANY-ID",
  "psn" : "TS-123456",
  "validFrom" : "2023-08-04T09:56:14.135331",
  "validFromInherited" : false,
  "validTo" : "2026-02-04T09:56:14.135341",
  "validToInherited" : false
}, {
  "id" : "10000008914",
  "idType" : "ANY-ID",
  "psn" : "TS-123457",
  "validFrom" : "2023-08-04T09:56:14.135348",
  "validFromInherited" : false,
  "validTo" : "2026-02-04T09:56:14.13535",
  "validToInherited" : false
  } }'