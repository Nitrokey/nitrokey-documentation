FROM sphinxdoc/sphinx

WORKDIR /docs
COPY ../../../requirements.txt /docs
COPY ../../../sphinx-conf.py /docs/conf.py
COPY ../../../resources/_templates /docs/_templates
COPY ../../../resources/_static /docs/_static
COPY ../../../resources/_redirects /docs/_redirects
COPY ../../../locales /docs/locales
COPY ../../../source /docs
RUN pip3 install -r requirements.txt

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Executes `entrypoint.sh` when the Docker container starts up
ENTRYPOINT ["/entrypoint.sh"]
