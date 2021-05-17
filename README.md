# fastapi-poetry
A Docker image to add [poetry](https://poetry.eustace.io) support via [ONBUILD](https://docs.docker.com/engine/reference/builder/#onbuild) to Sebastián Ramírez's excellent [uvicorn-gunicorn-fastapi](https://hub.docker.com/r/tiangolo/uvicorn-gunicorn-fastapi) [FastAPI](https://fastapi.tiangolo.com/) image.

# Usage

* Use this image as the **FROM** argument in a container.

* Copy all source files to */app/* in the container

* Ensure there is a *pyproject.toml* in the root directory - it will be copied into the directory and all contents **poetry install**ed into the container.

* The container will expect to find a FastAPI application called *app* in a file called *main.py*.

For full usage details of the comprehensive underlying *uvicorn-gunicorn-fastapi* image, see its [Docker Hub repo](https://hub.docker.com/r/tiangolo/uvicorn-gunicorn-fastapi).

# Example Child Project

## Project Directory

```
- Dockerfile
- pyproject.toml
- app/
     - main.py
     - other_python_source.py
```

## Dockerfile

``` docker
FROM fastapi-poetry:latest

COPY app/* /app/

```

# Versions and Packages

A manifest file detailing the Python, FastAPI, and Poetry versions and the installed Python packages is in a file inside the image at **/manifest.txt**.

# Update Schedule

This image is built and pushed to registries once a month.

# Development

The source for this image is kept and developed in [this GitLab repository](https://gitlab.com/kimvanwyk/fastapi-poetry-container).

# Licensing

This image is licensed under the [MIT License](https://gitlab.com/kimvanwyk/fastapi-poetry-container/-/blob/9ece73598b9e519106f8e036e3bf8bab181d5683/LICENSE) like the underlying underlying *uvicorn-gunicorn-fastapi* image.

# Authors

* [Kim van Wyk](https://gitlab.com/kimvanwyk)

# Acknowledgements
This image is based entirely on the work of [Sebastián Ramírez](https://github.com/tiangolo).
