
**Q:** What is the maximum length of the PIN?
    Nitrokey uses PINs instead of passwords. The main difference is that the
    hardware limits the amount of tries to three while a limit doesn't exist for
    passwords. Because of this, a short PIN is still secure and there is not need
    to choose a long and complex PIN.

    Nitrokey Storage's PINs can be up to 20 digits long and can consist
    of numbers, characters and special characters. Note: When using GnuPG or
    OpenSC, 32 character long PINs can be used but aren't supported by Nitrokey
    App.

**Q:** What is the User PIN for?
    The user PIN is at least 6-digits long and is used to get
    access to the contect of the Nitrokey. This is the PIN you will use a lot in
    every day use e.g. for decrypting messages, for unlocking your encrypted
    storage (NK Storage only) etc.
  
    The user PIN can have up to 20 digits and other characters (e.g. alphabetic
    and special characters). But as the user PIN is blocked as soon three wrong
    PIN attempts were done, it is sufficiently secure to only have a 6 digits
    PIN. The default PIN is 123456.

**Q:** What is the Admin PIN for?
    The admin PIN is at least 8-digits long and is used to change
    contents/settings of the Nitrokey. That is to say after initializing the
    Nitrokey you probably won't need this PIN too often (e.g. if you want to add
    another password to the password safe of the Nitrokey Pro or Nitrokey
    Storage).
  
    The admin PIN can have up to 20 digits and other characters (e.g. alphabetic
    and special characters). But as the admin PIN is blocked as soon three wrong
    PIN attempts were done, it is sufficiently secure to only have 8 digits PIN.
    The default PIN is 12345678.