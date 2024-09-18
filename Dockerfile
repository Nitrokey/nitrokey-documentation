FROM sphinxdoc/sphinx

WORKDIR /docs
COPY requirements.txt /docs
COPY locales /docs/locales
COPY source /docs
RUN pip3 install -r requirements.txt
