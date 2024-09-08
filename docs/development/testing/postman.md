# Testing with Postman

!!! quote "What is postman? Description from there site"

    Postman is an API platform for building and using APIs. Postman simplifies each step of the API lifecycle and streamlines collaboration so you can create better APIs—faster.

!!! danger "Local testing only"

    The reset should only be performed on your local system and can only be used if you are using PostgreSQL with Docker.


In the following sections we will explain how this works and how to set things up.
Since we want to test our interfaces, it is helpful to reset things and receive tokens **before each test**.
Besides postman, we have implemented a simple interface to reset the database, as postman only queries interfaces and cannot execute things like shell scripts directly from disk.

## Installation

--8<-- "docs/assets/snippets/local-administration-permission.snippet"

    When you start Node.Js for the first time, you may have to accept that the Node.Js runtime environment is added to the exceptions that has access to your network.

    <figure markdown>
      ![Accept exception](/assets/images/tests/accept-network.jpg){ loading=lazy }
      <figcaption>Accept Network access</figcaption>
    </figure>


[Download the free version of postman](https://www.postman.com/downloads/) and install it. You don't need an account if you don't want one.
Start it and continue with installing [Node.js](https://nodejs.org/en/). After installing Node.js you install the modules for the simple reset/restore interface.

```shell title="Installing node modules for the restore interface"
cd scripts/restore-api/
npm install
```

If everything went fine, you can start the program. After a successful start it should tell you which port it is listening on (should be port 3000). It also walks you through its functions.
```shell title="Start the program"
node restore-api.js
```
This interface interacts directly with the specified Docker PostgreSQL container and attempts to perform the dump recovery. This effectively resets the system.

We are now able to continue with the next parapraph [Collection](/development/testing/postman/#collection).

## Collection and Requests
In this section we import our already minimal collection of examples.

[Click here to get and copy the raw collection](/assets/files/PSN Service.postman_collection.json), or go to `/assets/files/PSN Service.postman_collection.json` and download it yourself.
However. Open postman. In the top left you see "Import".
After importing. You will see 2 interfaces that should work immediately once you have started the underlying system. These are the development docker-compose, the service itself and the restore-api script.
Both examples will give you a quick overview of how to continue using postman.

If you want to set up your own collection, you can do so with the pre-request script and look at the following images.

Use `{access_token}}` as the bearer token, as it is automatically fetched for you by the script before the each request.
<figure markdown>
  ![Bearer token setup](/assets/images/tests/postman_token_setup.png){ loading=lazy }
  <figcaption>Bearer token setup</figcaption>
</figure>

You can use this pre request script:
```js title="Postman pre request script"
--8<-- "docs/assets/files/postman-pre-request.js"
```

Here you can see an overview of all variables in the image below.
<figure markdown>
  ![Example variables](/assets/images/tests/example_variable_postman.png){ loading=lazy }
  <figcaption>Example variables in postman</figcaption>
</figure>

Now you can create requests by right-clicking on the collection.
When you create a request, do not forget to save sometimes.

Have fun testing.