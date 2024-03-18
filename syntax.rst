:orphan:

Nitrokey Documentation - Syntax
===============================

.. contents:: :local:

Code Blocks Syntax Highlighting
-------------------------------

Syntax Highlighting is disabled by default.
To enable it for a specific code snippet use the following:

.. code-block:: bash

   $ echo 'NetHSM rulez!' > data

H2 Heading
----------


Some text with ``inline.code();``

* This is a bulleted list.
* It has two items, the second
  item uses two lines.

1. This is a numbered list.
2. It has two items too.

Normal text again.

#. This is a numbered list.
#. It has two items too.

* this is
* a list

  * with a nested list
  * and some subitems

* and here the parent list continues

| These lines are
| broken exactly like in
| the source file.

H3 Heading
^^^^^^^^^^


Only the following message boxes should be used:

.. warning::

   Warning text.

.. note::

   Note text.

.. important::

   Important text.

.. tip::

   Tip text.


.. code-block:: bash

   echo "code";


Grid Table
----------

+------------+------------+-----------+
| Header 1   | Header 2   | Header 3  |
+============+============+===========+
| body row 1 | column 2   | column 3  |
+------------+------------+-----------+
| body row 2 | Cells may span columns.|
+------------+------------+-----------+
| body row 3 | Cells may  | - Cells   |
+------------+ span rows. | - contain |
| body row 4 |            | - blocks. |
+------------+------------+-----------+

Simple Table
------------

=====  =====  ======
   Inputs     Output
------------  ------
  A      B    A or B
=====  =====  ======
False  False  False
True   False  True
False  True   True
True   True   True
=====  =====  ======

This is a text that needs to be translated automatically.
This is another Line to be translated.

* This line is one of the tests for the automated translation workflow with weblate.
* Adding this text should trigger the complete workflow of translation.

This is `a Link  <https://f-droid.org/F-Droid.apk>`_ with the definition of the url inline.

This is another thest for `a URL  <https://f-droid.org/F-Droid.apk>`_ to test translation.


This is a plain link https://foobar.bas/slug1/slug2

This line contains the product name Nitrokey Start an should not be altered by the translation.


This command automatically inserts the title of an internal doc page you link to
::doc:: /link/to/doc

Mark cropped Output
-------------------

::

  ✄----------✄----------✄----------✄----------✄✄----------✄----------✄----------✄----------✄
