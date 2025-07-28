macOS Install
=============

Installing the Nitrokey App 2 via Pipenv
----------------------------------------

This is the simplest way for now to install the Nitrokey App 2 on macOS. Further methods are being worked on.

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
   
2. Update the app:

   .. code-block:: zsh

      pipenv run nitrokeyapp
