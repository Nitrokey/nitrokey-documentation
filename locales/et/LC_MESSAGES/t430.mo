��    A      $              ,     -     H  "   g  T   �  �   �     o  !   �  v   �  �   '  z   �  �   2     �  a     &   p  �  �  �   X
      1  Q   R     �     �     �  �   �  K   �  L   �  �   %  �   �  �   �  �   �  �        �  Q   �  �   7     �     �     �  7     [   G     �  P   �  �   �  /   �  /   �     �  V     C   b     �  �  �  �  O  �   �  �   �  �   �  �  Y  �   0  Q   �  �   .               ;  u  R  f   �     /      3      <      E   �  N      ,"     G"  !   f"  S   �"  �   �"  '   b#  "   �#  x   �#  �   &$  s   �$  �   (%      �%  g   �%  3   e&  �  �&  �   P(     )  P   3)     �)  
   �)     �)  �   �)  V   y*  Q   �*  �   "+  �   �+  �   �,  �   _-  �   �-  	   �.  R   �.  {   	/     �/     �/  "   �/  8   �/  c   0     s0  R   {0  �   �0  ,   e1  @   �1     �1  @   �1  ?   /2     o2  �  �2  �  4  �   �5  �   x6  �   O7  �  �7  �   �9  T   <:  �   �:  	   R;  !   \;  !   ~;  i  �;  w   
=     �=     �=     �=     �=   (Nitrokey T430 - Qubes OS) (Nitrokey T430 - Ubuntu Linux) Add “Network controler” device After purchase, the passwords are set to a default value and must be changed by you: After that, please follow `these instructions from step 3 onwards `system update <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. Behavior After a System Update Change Disk Encryption Passphrase Change the PINs of your Nitrokey as `described here <https://docs.nitrokey.com/pro/change-user-and-admin-pin.html>`__. Change the passphrase for disk encryption as `described here <https://docs.nitrokey.com/x230/ubuntu/change-disk-encryption-passphrase.html>`__. Change the passphrase for the hard disk encryption by running “sudo cryptsetup luksChangeKey /dev/sda2” in a terminal. Check each screw individually to see if its individual appearance matches the photo. It is best to use a magnifying glass or macro lens for this purpose. The screws are numbered as follows. Choose your operating system: Click on the Nitrokey icon on the left side of the screen to open the pre-installed Nitrokey App. Click “OK” and restart the system. Each boot the code is generated on the Nitropad and the Nitrokey, if its connected. It is allowed to run 10 boots without loosing the synchronization between the devices, after which the bad code signal is shown, regardless of the rest of the system being in a correct state. If you are sure the system was not beign tampered with (e.g. the Nitropad was booted more than 10 times without the Nitrokey), you can safely reset the system’s warning. Each time you start the NitroPad, you should - if possible - connect your Nitrokey. If the Nitrokey is plugged in and the system has not been modified, the following screen will appear when the NitroPad is turned on. Enter the your account password. Enter “PleaseChangeMe” as the current passphrase and select a secure new one. Generate new TOTP/HOTP secret Getting Started Go to Devices tab How the boot process may look like if the system has been changed (for example after an update) and what error messages may otherwise occur is described further below. If Qubes doesn’t boot as shown below, please execute the following steps: If Ubuntu doesn’t boot as shown below, please execute the following steps: If the bag or the screws do not match the photos sent, an unauthorized opening of your NitroPad cannot be excluded. In this case please contact us to arrange further action. If the information on the NitroPad does not match the information on the Nitrokey, the background would turn red and the message “Invalid Code” would appear. This could indicate that manipulation has taken place. If you have ordered the unit with the option “sealed screws and sealed bag”, please `verify the sealing <verify-sealed-hardware.html>`__ before unpacking. If you do not know what this means, skip this section. If you ordered your NitroPad with sealed screws and in a sealed bag, it allows you to check if the NitroPad has been tampered with during shipping. In case the Network Manager icon is not shown and when starting a VM an error like “Domain sys-net has failed to start: PCI device dom0:03_00.0 does not exist” is shown, proceed as follows: Invalid Code Left click on the gears and select “Change Passphrase” from the context menu. Next, the system will prompt you to enter the passphrase to decrypt the hard disk. The passphrase is initially “PleaseChangeMe”. |image3| NitroPad T430 NitroPad X230 with Qubes OS NitroPad X230 with Ubuntu Linux Open menu -> Service: sys-net -> sys-net: Qube Settings Open the pre-installed Nitrokey App and change the PINs of your Nitrokey as described here. Options Please connect the Nitrokey and execute the following from the main boot screen: Press Enter (“Default Boot”) after booting the system, provided the NitroPad has not shown any errors and the Nitrokey is lit green (see above). Remove “Unknown device” from the right side Restart your Laptop and go to Options. |image5| Secure Starting Procedure Select the field that says “Luks”. Afterwards it should have an orange background. Select “Update Checksums and sign all files on /boot”. |image6| TPM/TOTP/HOTP Options That’s why it’s important to restart your NitroPad under controlled conditions after a system update. Only when the new status has been confirmed can you leave the device unattended again. Otherwise, you will not be able to distinguish a possible attack from a system update. Detailed instructions for a system update can be `found here <https://docs.nitrokey.com/x230/qubes/system-update.html>`__. That’s why it’s important to restart your NitroPad under controlled conditions after a system update. Only when the new status has been confirmed can you leave the device unattended again. Otherwise, you will not be able to distinguish a possible attack from a system update. Detailed instructions for a system update can be `found here <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. The NitroPad X230 can also be started without the Nitrokey. If you don’t have the Nitrokey with you, but are sure that the hardware has not been manipulated, you can boot your system without checking. The NitroPad firmware checks certain system files for changes. If your operating system has updated important components, you will be warned the next time you boot the NitroPad. This could look like this, for example: The bag and all screws on the bottom of the device have been sealed. For the bag and each of these screws you have received a photo by e-mail. The orientation of the photos is such that the battery is on top. The box marked in red contains the information that the BIOS has not been changed and that the shared secret of the NitroPad and the Nitrokey match. But this information is not sufficient, because an attacker could have faked it. If at the same time the Nitrokey also flashes green, everything is fine. An attacker would have to have had access to the NitroPad and Nitrokey to achieve this result. It is therefore important that you do not leave both devices unattended. The system will then guide you through the process of creating a user account. After that you should have successfully booted the system and could already use it normally. This example shows a sealed screw whose glitter represents an individual pattern. To change the passphrase for disk encryption, first click on “Activities” in the upper left corner and enter “disk” in the search bar. Then select the “Disks” program that appears in the middle of the screen. Troubleshooting Verification of Sealed Hardware Verify Sealed Hardware With the NitroPad X230, malicious changes to the BIOS, operating system, and software can be easily detected. For example, if you left your NitroPad in a hotel room, you can use your Nitrokey to check if it has been tampered with while you were away. If an attacker modifies the NitroPad’s firmware or operating system, the Nitrokey will detect this (instructions below). and follow the on-screen guide. After that the secret and counter should be both reset to a new value. img |image1| |image2| |image4| Project-Id-Version: Nitrokey Documentation
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-03-18 14:53+0100
PO-Revision-Date: 2022-01-11 15:11+0000
Last-Translator: Anonymous <noreply@weblate.org>
Language: et
Language-Team: Estonian <https://translate.nitrokey.com/projects/nitrokey-documentation/documentation-t430/et/>
Plural-Forms: nplurals=2; plural=n != 1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 (Nitrokey T430 - Qubes OS) (Nitrokey T430 - Ubuntu Linux) Lisage seade "Network controler". Pärast ostu sooritamist on paroolid määratud vaikimisi ja neid peate ise muutma: Pärast seda järgige `toimige alates 3. sammust `süsteemi uuendamine <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. Käitumine pärast süsteemi uuendamist Ketta krüpteerimisfraasi muutmine Muutke oma Nitrokey PIN-koodid nagu `kirjeldatud siin <https://docs.nitrokey.com/pro/change-user-and-admin-pin.html>`__. Muuda kettakrüpteerimise salasõna nagu `kirjeldatud siin <https://docs.nitrokey.com/x230/ubuntu/change-disk-encryption-passphrase.html>`__. Muutke kõvaketta krüpteerimise salasõna, käivitades terminalis käsu "sudo cryptsetup luksChangeKey /dev/sda2". Kontrollige iga kruvi eraldi, et näha, kas selle välimus vastab fotole. Selleks on kõige parem kasutada suurendusklaasi või makroobjektiivi. Kruvid on nummerdatud järgmiselt. Valige oma operatsioonisüsteem: Klõpsake ekraani vasakul poolel oleval Nitrokey ikoonil, et avada eelinstalleeritud Nitrokey rakendus. Klõpsake nuppu "OK" ja käivitage süsteem uuesti. Igal käivitamisel genereeritakse kood Nitropadil ja Nitrokey'l, kui see on ühendatud. Lubatud on 10 käivitamist ilma seadmete vahelise sünkroniseerimise kaotamiseta, mille järel kuvatakse halva koodi signaal, olenemata sellest, kas ülejäänud süsteem on õiges olekus. Kui te olete kindel, et süsteemi ei ole võltsitud (nt Nitropadiga tehti rohkem kui 10 buutimist ilma Nitrokey'teta), võite süsteemi hoiatuse julgelt nullida. Iga kord, kui käivitate NitroPad'i, peaksite - kui võimalik - ühendama oma Nitrokey'i. Kui Nitrokey on ühendatud ja süsteemi ei ole muudetud, ilmub NitroPadi sisselülitamisel järgmine ekraan. Sisestage oma konto parool. Sisestage praeguse salasõna "PleaseChangeMe" ja valige uus turvaline salasõna. Uue TOTP/HOTP-saladuse loomine Alustamine Minge vahekaardile Seadmed Seda, kuidas käivitamisprotsess võib välja näha, kui süsteemi on muudetud (näiteks pärast uuendust) ja millised veateated võivad muidu ilmneda, on kirjeldatud allpool. Kui Qubes ei käivitu nii, nagu allpool näidatud, siis viige läbi järgmised sammud: Kui Ubuntu ei käivitu nii, nagu allpool näidatud, siis tehke järgmised sammud: Kui kott või kruvid ei vasta saadetud fotodele, ei saa välistada NitroPadi omavolilist avamist. Sellisel juhul võtke meiega ühendust, et leppida kokku edasised meetmed. Kui NitroPadil olev teave ei vasta Nitrokey'l olevale teabele, muutub taust punaseks ja ilmub teade "Invalidne kood". See võib viidata sellele, et on toimunud manipuleerimine. Kui olete seadme tellinud valikuga "pitseeritud kruvid ja pitseeritud kott", palun `kontrollige enne lahtipakkimist pitseerimist <verify-sealed-hardware.html>`__. Kui te ei tea, mida see tähendab, jätke see lõik vahele. Kui olete tellinud NitroPadi pitseeritud kruvidega ja pitseeritud kotis, võimaldab see teil kontrollida, kas NitroPadi on transportimise ajal võltsitud. Kui võrguhalduri ikooni ei kuvata ja VM-i käivitamisel ilmneb viga nagu "Domeeni sys-net ei õnnestunud käivitada: PCI seade dom0:03_00.0 ei ole olemas", toimige järgmiselt: Vale kood Klõpsake vasakuga hammasratastel ja valige kontekstmenüüst "Change Passphrase". Seejärel palub süsteem sisestada kõvaketta dekrüpteerimiseks salasõna. Salasõna on esialgu "PleaseChangeMe". |image3| NitroPad T430 NitroPad X230 koos Qubes OS-iga NitroPad X230 koos Ubuntu Linuxiga Ava menüü -> Teenus: sys-net -> sys-net: Qube Settings Avage eelinstalleeritud Nitrokey rakendus ja muutke oma Nitrokey PIN-koodid, nagu siin kirjeldatud. Valikud Palun ühendage Nitrokey ja käivitage peast käivitamisekraanilt järgmine käsk: Vajutage Enter ("Default Boot") pärast süsteemi käivitamist, kui NitroPad ei ole näidanud ühtegi viga ja Nitrokey põleb roheliselt (vt eespool). Eemaldage "Tundmatu seade" paremalt küljelt Käivitage oma sülearvuti uuesti ja minge valikudesse. |image5| Turvaline stardiprotseduur Valige väli "Luks". Seejärel peaks see olema oranžil taustal. Valige "Update Checksumm and sign all files on /boot". |image6| TPM/TOTP/HOTP Valikud Seepärast on oluline, et pärast süsteemi uuendamist käivitaksite NitroPad kontrollitud tingimustes uuesti. Alles siis, kui uus olek on kinnitatud, võite seadme uuesti järelevalveta jätta. Vastasel juhul ei suuda te võimalikku rünnakut süsteemivärskendusest eristada. Üksikasjalikud juhised süsteemi uuendamise kohta leiate siit `kaudu <https://docs.nitrokey.com/x230/qubes/system-update.html>`__. Seepärast on oluline, et pärast süsteemi uuendamist käivitaksite NitroPad kontrollitud tingimustes uuesti. Alles siis, kui uus olek on kinnitatud, võite seadme uuesti järelevalveta jätta. Vastasel juhul ei suuda te võimalikku rünnakut süsteemivärskendusest eristada. Üksikasjalikud juhised süsteemi uuendamise kohta leiate ` siit <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. NitroPad X230 saab käivitada ka ilma Nitrokey võtmeta. Kui teil ei ole Nitrokey't kaasas, kuid olete kindel, et riistvara ei ole manipuleeritud, võite süsteemi käivitada ilma kontrollimata. NitroPad püsivara kontrollib teatud süsteemifailide muutusi. Kui teie operatsioonisüsteem on uuendanud olulisi komponente, siis hoiatatakse teid NitroPadi järgmisel käivitamisel. See võib näida näiteks nii: Kott ja kõik kruvid seadme põhjas on suletud. Koti ja iga kruvi kohta olete saanud e-kirjaga foto. Fotode orientatsioon on selline, et aku on üleval. Punasega märgitud kast sisaldab teavet selle kohta, et BIOSi ei ole muudetud ja et NitroPad'i ja Nitrokey jagatud saladus vastab. Kuid sellest teabest ei piisa, sest ründaja oleks võinud seda võltsida. Kui samal ajal vilgub Nitrokey ka roheliselt, on kõik korras. Ründaja peab olema saanud juurdepääsu NitroPadile ja Nitrokey'le, et saavutada selline tulemus. Seetõttu on oluline, et te ei jätaks mõlemat seadet järelevalveta. Seejärel juhatab süsteem teid läbi kasutajakonto loomise protsessi. Pärast seda peaksite süsteemi edukalt käivitama ja seda juba normaalselt kasutama. See näide näitab suletud kruvi, mille sära kujutab endast individuaalset mustrit. Ketta krüpteerimise salasõna muutmiseks klõpsake kõigepealt vasakus ülanurgas nupul "Tegevused" ja sisestage otsinguribale "disk". Seejärel valige ekraani keskele ilmuv programm "Disks". Veaotsing Plommitud riistvara kontrollimine Kontrollida pitseeritud riistvara NitroPad X230 abil on võimalik hõlpsasti tuvastada pahatahtlikud muudatused BIOSis, operatsioonisüsteemis ja tarkvaras. Näiteks kui jätsite oma NitroPad'i hotellituppa, saate Nitrokey abil kontrollida, kas seda on teie äraoleku ajal võltsitud. Kui ründaja muudab NitroPadi püsivara või operatsioonisüsteemi, tuvastab Nitrokey selle (juhised allpool). ja järgige ekraanil kuvatavat juhendit. Pärast seda peaksid nii saladus kui ka loendur nullistuma uuele väärtusele. img |image1| |image2| |image4| 