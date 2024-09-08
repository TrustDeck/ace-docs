---
glightbox: false
---

# HttpStatus Object and Codes  

??? abstract "We have tried to be as accurate as possible with our https status codes and follow a specific approach"

    <figure markdown>
      ![HTTP Decision Code Diagramm](/assets/images/http-decision-diagram.png){ loading=lazy }
      <figcaption>Source: https://www.loggly.com/blog/http-status-code-diagram/</figcaption>
    </figure>

## HttpStatus Object

If the service only returns the http status, the returned object looks like this.

```json title="Example Object/Reponse"
--8<-- "docs/assets/files/404-not_found.json"
```

## StatusCodes

| Status | Name                             | Triggering Event                                                                                          |
|--------|----------------------------------|-----------------------------------------------------------------------------------------------------------|
| 200    | OK                               | Request was successfully with a return.                                                                   |
| 201    | CREATED                          | The request was successful with a return. At least one object was created within the requested interface. |
| 204    | NO CONTENT                       | The request was successful without a return.                                                              |
--8<-- "docs/assets/snippets/httpstatus_codes.snippet"

