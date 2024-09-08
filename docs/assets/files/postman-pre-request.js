//collection variables for token and dump restore
var client_id      = pm.collectionVariables.get("client_id");
var client_secret  = pm.collectionVariables.get("client_secret");
var token_endpoint = pm.collectionVariables.get("token_endpoint");
var grant_type     = pm.collectionVariables.get("grant_type");
var username       = pm.collectionVariables.get("username");
var password       = pm.collectionVariables.get("password");

var dockerContainer = pm.collectionVariables.get("docker_container");
var dockerPostgresUsername = pm.collectionVariables.get("docker_ps_username");
var dockerPostgresPassword = pm.collectionVariables.get("docker_ps_password");
var dockerPostgresDatabase = pm.collectionVariables.get("docker_ps_database");

// Create request objects and variables
var details = {
    "grant_type" : grant_type,
    "username" : username,
    "password" : password,
    "client_id" : client_id,
    "client_secret" : client_secret
}

var formBody = [];
for (var property in details) {
    var encodedKey = encodeURIComponent(property);
    var encodedValue = encodeURIComponent(details[property]);
    formBody.push(encodedKey + "=" + encodedValue);
}
formBody = formBody.join("&");

var local_dump_restore_endpoint = "http://localhost:3000/restore?container="+dockerContainer+"&username="+dockerPostgresUsername+"&password="+dockerPostgresPassword+"&db="+dockerPostgresDatabase;

// Do nested request to restore database and request token
pm.sendRequest({
    url: local_dump_restore_endpoint,
    method: 'GET',
},  function(err, response) {
    console.log(response);
    pm.sendRequest({
        url: token_endpoint,
        method: 'POST',
        header: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formBody
    },  function(err, response) {
        const jsonResponse = response.json();
        console.log(jsonResponse);
        pm.collectionVariables.set("access_token", jsonResponse.access_token);
        console.log(pm.collectionVariables.get("access_token"));
    });
 });


