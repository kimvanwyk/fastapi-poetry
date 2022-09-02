FROM tiangolo/uvicorn-gunicorn-fastapi:python3.7

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | POETRY_HOME=/opt/poetry python3 - && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false

WORKDIR /app

RUN echo "Tag:" >> /manifest.txt; echo $(date +%y%m%d)-fastapi$(python -c "import fastapi; print(fastapi.__version__)")-python$(python --version | cut -d " " -f2)-poetry$(poetry --version | cut -d " " -f3) >> /manifest.txt; echo "\nVersions:" >> /manifest.txt; echo $(python --version) >> /manifest.txt; echo $(pip --version) >> /manifest.txt; echo $(poetry --version) >> /manifest.txt; echo "\nPackages:" >> /manifest.txt; echo $(pip freeze) >> /manifest.txt; 

# Install Pipfile contents system-wide
ONBUILD COPY pyproject.toml pyproject.toml
ONBUILD RUN poetry install && poetry cache clear --all -n pypi && poetry cache clear --all -n . && rm pyproject.toml && rm poetry.lock
