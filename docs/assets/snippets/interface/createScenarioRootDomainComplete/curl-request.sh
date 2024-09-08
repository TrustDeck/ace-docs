curl 'http://localhost:8080/api/pseudonymization/domain/complete' -i -X POST \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '{
  "name" : "ProjectX",
  "prefix" : "PX-",
  "validFrom" : "2023-06-04T09:55:53",
  "validTo" : "2043-06-04T09:55:53",
  "enforceStartDateValidity" : true,
  "enforceStartDateValidityInherited" : true,
  "enforceEndDateValidity" : true,
  "enforceEndDateValidityInherited" : true,
  "algorithm" : "MD5",
  "algorithmInherited" : true,
  "pseudonymLength" : 16,
  "description" : "That is the beginning of a long journey"
  }'