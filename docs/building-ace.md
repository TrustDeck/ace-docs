---
glightbox: false
---


# Building ACE

--8<-- "docs/assets/snippets/local-administration-permission.snippet"

First, clone the git repository

```shell title=""
git clone https://github.com/TrustDeck/ace.git
cd ace
```

## Building From Source
Make sure you install the Maven from the [prerequisites](/getting-started/prerequisites/#in-development): In Development.

### On Unix

--8<-- "docs/assets/snippets/remember-configure.snippet"

```shell title=""
mvn clean install -DskipTests=true -Djooq.skip=true -f pom.xml
cd target
java -jar ace.jar --spring.config.location=application.yml
```

This command installs all Maven packages and creates an executable `.jar` file in the `/target` directory.
It also ensures that the tests and other unnecessary generation are skipped and only the installation process takes place here. 
The last command runs the generated `.jar`.

### On Windows

There are many ways to create the service. We describe the way with the IDE Intellj IDEA on Windows.

Once you've install the IDE you can open the project by just importing and selecting the folder of the repository. 
In the top Menubar right next to the green hammer symbol click in the dropdown on `Edit Configurations ... ` to create a new maven configuration. The name of this configuration can be anything you like.
Now. Follow the setup like in the picture below and copy the command for "Run".
Note that the respective JAVA version and Maven are used by default by the IDE and the working directory is the root directory of the repository.

```shell title=""
clean install -DskipTests=true -Djooq.skip=true -f pom.xml
```

This command installs all Maven packages and creates an executable `.jar` file in the `/target` directory.
This command also ensures that the tests and other unnecessary generation are skipped and only the installation process takes place here. You can run it later through your IDE.

<figure markdown>
![Maven Configuration](/assets/images/create_maven_configuration.png){ loading=lazy }
<figcaption>Example maven setup to install all maven packages without tests and creating an executable file</figcaption>
</figure>



## Building Docker Image

```shell title=""
docker build --no-cache -t ace:latest --file Dockerfile .
```

This creates the image with the name `ace` and version `latest`

!!! tip "Mac M1 Chip"
    If you want to use Docker on your Mac with an M1 chip, you will have to build most of the containers yourself, as they are heavily customised.
    Generic example with buildx for arm64 based computers:

    ```shell title="Generic command for Mac M1 chip"
    docker buildx build --platform linux/arm64 --tag software:1.0.0 .
    ```

## Serve
You can use docker compose to serve ACE. To do this, you can follow [this guide](http://localhost:8000/getting-started/setup/) or check our example `docker-compose.yml` in `assets/examples`.




