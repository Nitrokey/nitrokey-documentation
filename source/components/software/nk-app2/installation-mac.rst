macOS Install
=============

Installing the Nitrokey App 2 via uv
-------------------------------------

This is the simplest and fastest way to install the Nitrokey App 2 on macOS using `uv`, an extremely fast Python package manager.

1. Install `uv` if it is not already installed:

   .. code-block:: zsh

      curl -LsSf https://astral.sh/uv/install.sh | sh

   Alternatively, if you have Homebrew:

   .. code-block:: zsh

      brew install uv

2. Install the Nitrokey App:

   .. code-block:: zsh

      uv tool install nitrokeyapp

To update the app:

.. code-block:: zsh

   uv tool upgrade nitrokeyapp

To run the application:

.. code-block:: zsh

   nitrokeyapp

Installing the Nitrokey App 2 via Pipenv
-----------------------------------------

This is an alternative way to install the Nitrokey App 2 on macOS.

1. `Install <https://pipenv.pypa.io/en/latest/installation.html>`__ pipenv if it is not already installed.

2. Create a work directory:

   .. code-block:: zsh

      mkdir nitrokeyapp

3. Enter the directory:

   .. code-block:: zsh

      cd nitrokeyapp

4. Install the app via pipenv:

   .. code-block:: zsh

      pipenv install nitrokeyapp

The app can be updated the following way:



Updating
--------

1. Enter the work directory:

   .. code-block:: zsh
   
      cd nitrokeyapp
   
2. Update the app:

   .. code-block:: zsh

      pipenv update


Starting
--------

To run the application:

1. Enter the work directory:

   .. code-block:: zsh

      cd nitrokeyapp
   
2. Run the app:

   .. code-block:: zsh

      pipenv run nitrokeyapp
