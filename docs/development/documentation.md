---
glightbox: false
---

## Documentation
If you want to install the packages for the docs, see this [page](/building/#building-from-source).
To start the docs locally, simply run the following command after you have installed the packages.

```shell title="Serve docs"
mkdocs serve
```
This should serve the docs under [http://localhost:8000/](http://localhost:8000/)
Everything for the docs is located in the `docs/` folder except the configuration `mkdocs.yml`.
Whenever you change something in the docs, it is automatically updated in the browser.

### Edit the docs

We're using [mkdocs](https://www.mkdocs.org/) for our documentation and [mkdocs-material](https://squidfunk.github.io/mkdocs-material/) for theming.

## Interface snippet creation helper
We have implemented a tool to create the snippets for all interfaces.

```shell title="Helper usage"
cd scripts/gen-docs-helper
python gen.py
```

This extracts all configured output from the JUnit test into `target/generated-snippets` and converts them into a usable format for documentation.
It also shows you in a very simple way what is old and what is new.