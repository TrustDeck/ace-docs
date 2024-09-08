---
glightbox: false
---

# Authentication
For the underlying authentication we use Keycloak. However, we will not explain Keycloak here. [But you can read about it here.](https://www.keycloak.org/) Rather, we will explain here how to integrate it in your code.

Here are some links we used to integrate our keycloak solution:

- [handle two times validation error](https://stackoverflow.com/questions/67126412/keycloak-spring-boot-spring-security-does-somehow-token-validation-2-times-i?rq=1)
- [extended auth execution handling #1](https://stackoverflow.com/questions/39512849/spring-boot-spring-security-authenticationentrypoint-not-getting-executed?rq=1)
- [extended auth execution handling #2](https://stackoverflow.com/questions/62020825/keycloak-get-401-error-but-spring-security-does-not-handle-this-error)
- [custom error message on preauthorize](https://stackoverflow.com/questions/45060023/custom-error-message-with-preauthorize-and-controlleradvice)
- [inspiration for the implementation](https://gist.github.com/Kouagou/ee68f2c77be9488109d658c965a73a54)
- [getting keycloak token in controller #1](https://stackoverflow.com/questions/54365415/can-not-get-keycloak-authorization-token-in-spring)
- [getting keycloak token in controller #2](https://www.n-k.de/2016/05/how-to-get-accesstoken-from-keycloak-springboot-javaee.html)
- [keycloak and spring boot 3](https://medium.com/geekculture/using-keycloak-with-spring-boot-3-0-376fa9f60e0b)
- [spring boot 3 security repo example](https://github.com/elirenato/secure-api-spring)

## Keycloak Interfaces and Functions
We defined two use cases. The first one is to check before request-handling is accepted. The second one is to check some roles within the request.

!!! missing "Include Roles"

    You must include the Keycloak roles of the client in the access token. If you don't know you can read about it [here](/guides/keycloak/)

### Annotation
With this annotation you can check if the client has the necessary roles by using the `hasRoles()` method. A list of domains and roles is passed to the method. Spring-Boot can also pass simple get parameters or paths which are strings too.

```java title="This is an example on a controller method with the annotation"
@PreAuthorize("hasRoles(#domain, 'write')")
public ResponseEntity<T> doSomething(@PathVariable String domain) {
   ...
}
```
In this example the requester must have the name of the domain as a role and the role 'write'.
If not, the requester receives automatically a `403 FORBIDDEN` status.

### Parameter
You can pass a JwtAuthenticationToken object as a parameter in the specific controller method to make use of it.

```java title="This is a example for parameter use"
public ResponseEntity<T> doSomething(JwtAuthenticationToken jwtAuthenticationToken, @PathVariable String domain) {
   // Retrieves all granted roles in a list of strings
   List<String> grantedRoles = jwtAuthenticationToken.getAuthorities().stream()
                .flatMap(x -> Stream.of(x.getAuthority())).toList();
   ...
}
```

!!! done "Automatic check"
    
    We have implemented an automatic check if a token is available and valid, if not, the system returns an http error code depending on it, which you can read [here](/getting-started/authentication/)