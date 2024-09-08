---
glightbox: false
---

# Python SDK 

[The python sdk can be found here]() which is used to abstract the service. 

## Installing

For installing this sdk you can also use an virtualenv. For setting up a virtual enviroment you can use this link which is working in [ubuntu](https://gist.github.com/Geoyi/d9fab4f609e9f75941946be45000632b).

1. Download this repository
```shell title=""
git clone TBA
```
2. Ensure setuptools is installed
```shell title=""
python3 -m pip install --upgrade setuptools
```
3. Then `cd` into the root directory where the `setup.py` is located and install the package with this command:
```shell title=""
python3 setup.py install
```
The package is installed now. You can delete the cloned repository you don't need it anymore accept for upgrades.


## Upgrading

1. First get the new source code by downloading the repository or simply drag the source code via Gitlab if you have not yet deleted the original repository.
```shell title=""
git pull
```
2. Then you can install from the source folder again.
```shell title=""
python3 setup.py install
```
This will overwrite the source.

## Example

This is a quick and simple example showing you how to interact with some endpoints. **Note that you must change the settings to get it work on your site. This is just an example and it does not verify https!**
```python title=""
#!/usr/bin/env python
# -*- coding: utf-8 -*-

from pprint import pprint
from ths_service_sdk import Service, AuthService, PsnService, Domain, Record
#used to tell the client to accept any ssl certificate
verify_https = False

# Instance auth service
realm = "development"
auth_url = "http://localhost:8080/auth"
client_id = "ace"
client_secret = "1h6T3Dnx45hrd4pgv7YdcIfP9GRarbpN"
username = "test"
password = "test"
auth_service = AuthService(realm, auth_url, client_id,
                           client_secret, username, password, verify_https)

# Instance psn service
psn_url = "http://localhost:9090/api/pseudonymization/"
#if this is False you must perform an logout yourself after the request
automatic_logout = True
psn_service = PsnService(psn_url, automatic_logout, verify_https)

# Bag for both instances
service = Service(auth_service, psn_service)

pprint("Create a domain")
#Create a domain
domain = Domain()
domain.name = "MyNewDomain"
domain.prefix ="MND-"
response = service.psn_service.create_domain(domain=domain)
pprint(response)
pprint(response.status_code == 201) #201 is success

pprint("Read a domain")
#Read a domain
response = service.psn_service.read_domain(name="TestStudie")
pprint(response.json())

pprint("Create a record")
#Create a record
domain_name = "TestStudie"
record = Record()
record.domain_name = domain_name
record.id = "123456"
record.id_type = "MyCoolSystemId"
response = service.psn_service.create_record(domain_name=domain_name, record=record)
try:
    #just try to show the body if given
    pprint(response.json())
except Exception as e:
    pprint(response)

pprint(response.status_code == 201) #201 is success

pprint("Read a record")
#Read a record by id and id type
response = service.psn_service.read_record_by_id(domain_name=domain_name, id="123456", id_type="MyCoolSystemId")
pprint(response.json())

#check if a role is assigned
pprint(service.psn_service.oidc_token.has_roles(["domain-create"]))
#check if the token is expired
pprint(service.psn_service.oidc_token.is_expired())
#return a list of all assigned roles
pprint(service.psn_service.oidc_token.roles())
```
This example is also available in the repository under `/example`

## Methods

### Auth Service
Below are the methods you can use within the `auth_service`.

#### Token
The following are basic methods for making requests to an oidc system to interact with tokens.

- `obtain_oidc_token()`
- `logout()`

### PSN Service
Below are the methods you can use within `psn_service` and the associated objects.

#### Domain

- `create_domain()`
- `create_domain_complete()`
- `read_domain()`
- `update_domain()`
- `update_domain_complete()`
- `delete_domain()`
- `read_domain_salt()`
- `update_domain_salt()`

#### Record

- `create_record()`
- `read_record_by_psn()`
- `read_record_by_id()`
- `update_record()`
- `update_record_complete()`
- `delete_record()`
- `create_record_batch()`
- `read_record_batch()`
- `update_record_batch()`
- `delete_record_batch()`

#### Experimental
These methods are still at an experimental stage

- `experimental_list_domain_hierarchy()`