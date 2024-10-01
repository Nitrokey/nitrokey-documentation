FROM sphinxdoc/sphinx

WORKDIR /docs
COPY requirements.txt /docs
COPY source/conf.py /docs
RUN pip3 install -r requirements.txt
