# Testing with Junit

Our Tests with JUnit always works the same:

1. Reset the database for the service before each test
2. Obtain a fresh before each test
3. Perform the test

Folder for tests: /tba/...

Please consider the following Requirements to make a test work:

- The Class and the Name of the File start with `Test`
- A Method which should perform as a test starts with `test` or ends with `Test`
- A Method which should perform as a test must be annotated with `@Test` 
- Please make use of the annotation `@DisplayName()` to receive human-readable-names

## Class structure

Extend your class with `AssertWebRequestService`. 
This will give you access to helpful variables and helper methods, e.g. `this.getAccessToken()` returns the token or `this.assertCreatedRequest()` lets you perform a request and asserts the basic response attributes.


```java title="Initial class"
public class TestsService extends AssertWebRequestService {
    //your methods
}
```

```java title="Initial Method"
@Test
@DisplayName("myTest")
public void myTest() throws Exception {
    //your code
}
```

That's it. You can read everything else about writing tests [here](https://junit.org/junit5/docs/current/user-guide/) or simply take a look at the existing tests.

## Requesthelper

We implement a helpful method for testing our interfaces and responses. We also store the request and response parameters in a separate file for use in our documentation.
 
- assertNotFoundRequest
- assertUnauthorizedRequest
- assertForbiddenRequest
- assertCreatedRequest
- assertBadRequestRequest
- assertOkRequest
- assertNoContent
- assertNotAcceptable
- assertUnprocessableEntity
- assertInternalServerError

```java title="Example usage"
Map<String, String> parameters = new HashMap<>() {
    private static final long serialVersionUID = 6408752344331371975L;

    {
        put("psn", "PSN-123456");
    }
};

//perform 200 ok request
MockHttpServletResponse response = this.assertOkRequest("readRecordByPseudonym", get("/api/pseudonymization/domain/TestStudie/pseudonym"), parameters, null, this.getAccessToken());
String content = response.getContentAsString();
Record record = this.applySingleJsonContentToClass(content, RecordDto.class);
//work with the Record object
```

Each method uses the same parameter:
```text title=""
method(identifier, method, parameter, body, token)
```

- `identifier`: Used to find the output in the destination snippet folder prefixed with `doc_`.
- `method`: One of the static methods `get()`, `put()`, `post()` or `delete()`.
- `parameter`: These are the Get parameters in a `Map<String, String>`, if required.
- `body`: An object like record or domain. It will be automatically converted to json later.
- `token`: The access token, if required.

The example also shows you how to assign the answer to the respective object.

## Run tests
In the following examples we use Intellj to perform tests.

1: First we click on "Edit configurations..." in the upper right corner. This opens a general window to add a new configuration. Select the configuration and click on the green "Bug" to run it in debug mode.
<figure markdown>
  ![Edit config](/assets/images/tests/junit_edit_config.png){ loading=lazy }
  <figcaption>Edit config</figcaption>
</figure>

2: This is an example of creating a test that runs all tests.
You can add additional parameters to enable asynchronous logging, which is closer to a real setup.

```shell title="additional parameters"
-ea -Dlog4j2.contextSelector=org.apache.logging.log4j.core.async.AsyncLoggerContextSelector
```

<figure markdown>
  ![Create config all](/assets/images/tests/junit_create_config_all.png){ loading=lazy }
  <figcaption>Create a config for all</figcaption>
</figure>

3: This is an example of creating a test that executes a single method.
<figure markdown>
  ![Create config method](/assets/images/tests/junit_create_config_method.png){ loading=lazy }
  <figcaption>Create a config for a single method</figcaption>
</figure>