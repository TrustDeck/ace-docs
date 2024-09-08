---
glightbox: false
---

# Response Formats

The response format can be used by setting the header [`Accept`](https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Accept) in the request.
This will let us know which response format you want. This can be taken from the table below.
The value of the header follows the [standard media-types](https://www.iana.org/assignments/media-types/media-types.xhtml).
If you don't set the Header. We assume as the default value `application/json`.

| Media Types        | Default          | Description                                                |
|--------------------|------------------|------------------------------------------------------------|
| `text/plain`       | :material-check: | Returns a single selected (most important) plaintext value |
| `application/json` |                  | Returns data as a JSON blob                                |


## text/plain Format
The `text/plain` format is very special and is recommended for high performance computing. It is very simple and focuses only on necessary values.
The default and most commonly used format is still `json`.

## FHIR Format
[FHIR](https://www.hl7.org/fhir/) endpoints are completely different because they are based on highly standardized resources.
More information about our FHIR-Endpoints are coming in future.
