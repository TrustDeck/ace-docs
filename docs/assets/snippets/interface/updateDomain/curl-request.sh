curl 'http://localhost:8080/api/pseudonymization/domain?name=TestStudie' -i -X PUT \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '{
  "id" : 1,
  "name" : "TestStudie",
  "prefix" : "TS-",
  "validFrom" : "2022-02-26T19:15:20.885853",
  "validFromInherited" : false,
  "validTo" : "2052-02-19T19:15:20.885853",
  "validToInherited" : false,
  "enforceStartDateValidity" : true,
  "enforceStartDateValidityInherited" : false,
  "enforceEndDateValidity" : true,
  "enforceEndDateValidityInherited" : false,
  "algorithm" : "MD5",
  "algorithmInherited" : false,
  "consecVal" : 1,
  "pseudonymLength" : 32,
  "pseudonymLengthInherited" : false,
  "paddingCharacter" : "0",
  "paddingCharacterInherited" : false,
  "salt" : "azMPTIQXJsept_4nDj5B1BXN83Bj_8VJ",
  "saltLength" : 32,
  "description" : "das ist ein test2"
  }'