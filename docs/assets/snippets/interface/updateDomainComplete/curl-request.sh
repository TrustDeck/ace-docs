curl 'http://localhost:8080/api/pseudonymization/domain/complete?name=TestStudie&recursive=false' -i -X PUT \
    -H 'Content-Type: application/json;charset=UTF-8' \
    -H 'Authorization: Bearer <access_token>' \
    -d '{
  "id" : 1,
  "name" : "TestStudie",
  "prefix" : "TS-",
  "validFrom" : "2022-03-08T19:15:20",
  "validFromInherited" : false,
  "validTo" : "2052-02-29T19:15:20",
  "validToInherited" : false,
  "enforceStartDateValidity" : true,
  "enforceStartDateValidityInherited" : false,
  "enforceEndDateValidity" : true,
  "enforceEndDateValidityInherited" : false,
  "algorithm" : "BLAKE3",
  "algorithmInherited" : false,
  "consecVal" : 10,
  "pseudonymLength" : 16,
  "pseudonymLengthInherited" : false,
  "paddingCharacter" : "1",
  "paddingCharacterInherited" : false,
  "salt" : "foobar",
  "saltLength" : 32,
  "description" : "das ist ein test"
  }'