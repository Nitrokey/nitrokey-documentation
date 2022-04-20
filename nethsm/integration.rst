Integration into Custom Application
---------------------------------

To integrate the NetHSM into own custom applications client libraries are available for almost all programming languages, including JavaScript, C++ and Python for example. Therefore we recommend using `OpenAPI Generator <https://github.com/OpenAPITools/openapi-generator>`_.

To list all the available languages, you enter

.. code:: bash 

 $ docker run --pull --rm -ti openapitools/openapi-generator-cli list -i stable

Then you can generate the NetHSM client for your programming language like this:

.. code:: bash

 $ docker run --rm -ti -v "${PWD}/out:/out" openapitools/openapi-generator-cli generate -i=https://nethsmdemo.nitrokey.com/api_docs/gen_nethsm_api_oas20.json -o out -g javascript

The generated client code, in this example JavaScript, will be created in
the ``./out/`` directory. This folder also contains the necessary documentation how to use it.

