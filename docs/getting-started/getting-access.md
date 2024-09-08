---
glightbox: false
---

# Getting Access

--8<-- "docs/assets/snippets/testing-only-purposes.snippet"

## Example to obtain an access token

### Test-Credentials

If you used the SQL dump from Keycloak in the previous step, you can quickly use it with these credentials.

| Attribute     | Value                              |
|---------------|------------------------------------|
| realm         | `development`                      |
| client-id     | `ace`                      |
| username      | `test`                             |
| password      | `test`                             |
| grant_type    | `password`                         |
| client secret | `1h6T3Dnx45hrd4pgv7YdcIfP9GRarbpN` |

### Request

!!! warning "Make you use `host.docker.internal` otherwhise ACE won't be able to match and find the host"

--8<-- "docs/assets/snippets/curl-keycloak-access-token.snippet"

If you follow the quick setup with docker-compose, you don't need to change the values, just copy and paste this curl
command.

### Response

The Response will be an OpenID Connect (OIDC) Json Web Token (JWT). It contains an Access Token that you need for your first request.

It should look like this:

```json title="Example output for a token (tokesn are displayed in simplified form)"
{
    "access_token": "eyJhb....0E3yMraGCVGjw",
    "expires_in": 900,
    "refresh_expires_in": 1800,
    "refresh_token": "eyJhb....Emo_f3g",
    "token_type": "Bearer",
    "not-before-policy": 1682506166,
    "session_state": "053e26f9-fa5c-470b-b4a0-a1f44cec2693",
    "scope": "profile email"
}
```

You can check the content by going to this website: [https://jwt.io/](https://jwt.io/). Just copy the value for the
`access_token` into the "Encoded" section. You receive values for the header, the payload and the signature.

We need the `access_token` (lifespan is 15min) in the next step. If it has expired, simply request a new token or change the lifespan within the realm in keycloak.