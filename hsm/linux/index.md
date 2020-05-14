# Nitrokey HSM with GNU/Linux

1. Install [OpenSC](https://github.com/OpenSC/OpenSC/wiki). You need at least version 0.19. You can find recent builds for debian-based systems like Ubuntu [here](https://github.com/Nitrokey/opensc-build) if your system does not have the newest version of OpenSC. Alternatively, install [this](www.cardcontact.de/download/sc-hsm-starterkit.zip) driver ([source](https://github.com/CardContact/sc-hsm-embedded)).
2. If you didn't do so already, change the default SO-PIN ("3537363231383830") to your own choices. See [these instructions](https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#initialize-the-device). Afterwards you can begin to [generate new keys](https://github.com/OpenSC/OpenSC/wiki/SmartCardHSM#generate-key-pair).

Your Nitrokey is now ready to use. [Checkout](https://www.nitrokey.com/documentation/applications) the various use cases and supported applications.