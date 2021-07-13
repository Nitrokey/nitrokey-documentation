Generic FAQ
===========

**Q:** How can I factory-reset my NextBox?
  Press the hardware button for 5 seconds, see :doc:`technical/factory-reset`

**Q:** What do the different LED colors mean?
  The detailed document can be found here: :doc:`technical/led-colors`

**Q:** Can the inital setup be done using a monitor & keyboard?
  No, this is not possible as the regular login is disabled on delivery. Please connect the
  the NextBox to a network and access the NextBox using `nextbox.local`_ or the IP directly.

**Q:** What is the typical power consumption?
  The minimum of 0,6A (3W) is rarely reached, in idle mostly around 1A (5W) and more than 
  2A (10W) under higher loads. 

**Q:** Can I mirror my NextBox onto another NextBox?
  This translates to a cluster setup, which is considered an (paid) enterprise solution 
  by Nextcloud. The details, especially data consistency and collision handling, are far 
  from trivial to realize. Nevertheless, we also see demand for more sophisticated backup
  solutions and will address this issue.

**Q:** What to do to run/install/fix Nextcloud App "XYZ"? Why does Nextcloud feature XYZ not work?
  Generally we cannot help in detail for these topics. Nextcloud internals and apps are 
  out-of-scope for the NextBox development as we use the stock Docker images provided by Nextcloud.
  Ultimately, if some NextBox/OS configuration is blocking an app to run properly we for sure will
  look into fixing it.


.. _nextbox.local: http://nextbox.local

