FROM sphinxdoc/sphinx

WORKDIR /docs
COPY requirements.txt /docs
COPY sphinx-conf.py /docs/conf.py
COPY resources/_templates /docs/_templates
COPY resources/_static /docs/_static
COPY resources/_redirects /docs/_redirects
COPY locales /docs/locales
COPY source /docs
RUN pip3 install -r requirements.txt
