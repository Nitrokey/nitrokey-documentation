��    A      $              ,     -     H  "   g  T   �  �   �     o  !   �  v   �  �   '  z   �  �   2     �  a     &   p  �  �  �   X
      1  Q   R     �     �     �  �   �  K   �  L   �  �   %  �   �  �   �  �   �  �        �  Q   �  �   7     �     �     �  7     [   G     �  P   �  �   �  /   �  /   �     �  V     C   b     �  �  �  �  O  �   �  �   �  �   �  �  Y  �   0  Q   �  �   .               ;  u  R  f   �     /      3      <      E   �  N      +"     F"  '   e"  Y   �"  �   �"  #   t#  &   �#  �   �#  �   B$  y   �$  �   R%     5&  j   P&  '   �&  �  �&  �   �(  !   S)  Q   u)     �)     �)     �)  �   *  A   �*  W   �*  �   =+  �   ,  �   �,  �   �-  �   \.     -/  `   9/  �   �/     +0     90     T0  @   s0  n   �0  
   #1  9   .1  �   h1  )   2  =   12     o2  K   �2  K   �2     %3  �  >3  �  �4  �   u6  �   47  �   8  �  �8  �   �:  a   ];  �   �;     �<  #   �<      �<  �  �<  x   l>     �>     �>     �>     �>   (Nitrokey T430 - Qubes OS) (Nitrokey T430 - Ubuntu Linux) Add “Network controler” device After purchase, the passwords are set to a default value and must be changed by you: After that, please follow `these instructions from step 3 onwards `system update <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. Behavior After a System Update Change Disk Encryption Passphrase Change the PINs of your Nitrokey as `described here <https://docs.nitrokey.com/pro/change-user-and-admin-pin.html>`__. Change the passphrase for disk encryption as `described here <https://docs.nitrokey.com/x230/ubuntu/change-disk-encryption-passphrase.html>`__. Change the passphrase for the hard disk encryption by running “sudo cryptsetup luksChangeKey /dev/sda2” in a terminal. Check each screw individually to see if its individual appearance matches the photo. It is best to use a magnifying glass or macro lens for this purpose. The screws are numbered as follows. Choose your operating system: Click on the Nitrokey icon on the left side of the screen to open the pre-installed Nitrokey App. Click “OK” and restart the system. Each boot the code is generated on the Nitropad and the Nitrokey, if its connected. It is allowed to run 10 boots without loosing the synchronization between the devices, after which the bad code signal is shown, regardless of the rest of the system being in a correct state. If you are sure the system was not beign tampered with (e.g. the Nitropad was booted more than 10 times without the Nitrokey), you can safely reset the system’s warning. Each time you start the NitroPad, you should - if possible - connect your Nitrokey. If the Nitrokey is plugged in and the system has not been modified, the following screen will appear when the NitroPad is turned on. Enter the your account password. Enter “PleaseChangeMe” as the current passphrase and select a secure new one. Generate new TOTP/HOTP secret Getting Started Go to Devices tab How the boot process may look like if the system has been changed (for example after an update) and what error messages may otherwise occur is described further below. If Qubes doesn’t boot as shown below, please execute the following steps: If Ubuntu doesn’t boot as shown below, please execute the following steps: If the bag or the screws do not match the photos sent, an unauthorized opening of your NitroPad cannot be excluded. In this case please contact us to arrange further action. If the information on the NitroPad does not match the information on the Nitrokey, the background would turn red and the message “Invalid Code” would appear. This could indicate that manipulation has taken place. If you have ordered the unit with the option “sealed screws and sealed bag”, please `verify the sealing <verify-sealed-hardware.html>`__ before unpacking. If you do not know what this means, skip this section. If you ordered your NitroPad with sealed screws and in a sealed bag, it allows you to check if the NitroPad has been tampered with during shipping. In case the Network Manager icon is not shown and when starting a VM an error like “Domain sys-net has failed to start: PCI device dom0:03_00.0 does not exist” is shown, proceed as follows: Invalid Code Left click on the gears and select “Change Passphrase” from the context menu. Next, the system will prompt you to enter the passphrase to decrypt the hard disk. The passphrase is initially “PleaseChangeMe”. |image3| NitroPad T430 NitroPad X230 with Qubes OS NitroPad X230 with Ubuntu Linux Open menu -> Service: sys-net -> sys-net: Qube Settings Open the pre-installed Nitrokey App and change the PINs of your Nitrokey as described here. Options Please connect the Nitrokey and execute the following from the main boot screen: Press Enter (“Default Boot”) after booting the system, provided the NitroPad has not shown any errors and the Nitrokey is lit green (see above). Remove “Unknown device” from the right side Restart your Laptop and go to Options. |image5| Secure Starting Procedure Select the field that says “Luks”. Afterwards it should have an orange background. Select “Update Checksums and sign all files on /boot”. |image6| TPM/TOTP/HOTP Options That’s why it’s important to restart your NitroPad under controlled conditions after a system update. Only when the new status has been confirmed can you leave the device unattended again. Otherwise, you will not be able to distinguish a possible attack from a system update. Detailed instructions for a system update can be `found here <https://docs.nitrokey.com/x230/qubes/system-update.html>`__. That’s why it’s important to restart your NitroPad under controlled conditions after a system update. Only when the new status has been confirmed can you leave the device unattended again. Otherwise, you will not be able to distinguish a possible attack from a system update. Detailed instructions for a system update can be `found here <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. The NitroPad X230 can also be started without the Nitrokey. If you don’t have the Nitrokey with you, but are sure that the hardware has not been manipulated, you can boot your system without checking. The NitroPad firmware checks certain system files for changes. If your operating system has updated important components, you will be warned the next time you boot the NitroPad. This could look like this, for example: The bag and all screws on the bottom of the device have been sealed. For the bag and each of these screws you have received a photo by e-mail. The orientation of the photos is such that the battery is on top. The box marked in red contains the information that the BIOS has not been changed and that the shared secret of the NitroPad and the Nitrokey match. But this information is not sufficient, because an attacker could have faked it. If at the same time the Nitrokey also flashes green, everything is fine. An attacker would have to have had access to the NitroPad and Nitrokey to achieve this result. It is therefore important that you do not leave both devices unattended. The system will then guide you through the process of creating a user account. After that you should have successfully booted the system and could already use it normally. This example shows a sealed screw whose glitter represents an individual pattern. To change the passphrase for disk encryption, first click on “Activities” in the upper left corner and enter “disk” in the search bar. Then select the “Disks” program that appears in the middle of the screen. Troubleshooting Verification of Sealed Hardware Verify Sealed Hardware With the NitroPad X230, malicious changes to the BIOS, operating system, and software can be easily detected. For example, if you left your NitroPad in a hotel room, you can use your Nitrokey to check if it has been tampered with while you were away. If an attacker modifies the NitroPad’s firmware or operating system, the Nitrokey will detect this (instructions below). and follow the on-screen guide. After that the secret and counter should be both reset to a new value. img |image1| |image2| |image4| Project-Id-Version: Nitrokey Documentation
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-03-18 14:53+0100
PO-Revision-Date: 2022-01-11 15:11+0000
Last-Translator: Anonymous <noreply@weblate.org>
Language: sv
Language-Team: Swedish <https://translate.nitrokey.com/projects/nitrokey-documentation/documentation-t430/sv/>
Plural-Forms: nplurals=2; plural=n != 1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 (Nitrokey T430 - Qubes OS) (Nitrokey T430 - Ubuntu Linux) Lägg till enheten "Network controler". Efter köpet är lösenorden inställda på ett standardvärde och måste ändras av dig: Följ sedan ` dessa instruktioner från steg 3 och framåt `systemuppdatering <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. Beteende efter en systemuppdatering Ändra lösenfras för disk-kryptering Ändra PIN-koderna för din Nitrokey enligt `beskrivningen här <https://docs.nitrokey.com/pro/change-user-and-admin-pin.html>`__. Ändra lösenfrasen för diskkryptering enligt ` som beskrivs här <https://docs.nitrokey.com/x230/ubuntu/change-disk-encryption-passphrase.html>`__. Ändra lösenfrasen för hårddiskens kryptering genom att köra "sudo cryptsetup luksChangeKey /dev/sda2" i en terminal. Kontrollera varje enskild skruv för att se om dess utseende stämmer överens med bilden. Det är bäst att använda ett förstoringsglas eller ett makroobjektiv för detta ändamål. Skruvarna är numrerade enligt följande. Välj ditt operativsystem: Klicka på Nitrokey-ikonen till vänster på skärmen för att öppna den förinstallerade Nitrokey-appen. Klicka på "OK" och starta om systemet. Vid varje uppstart genereras koden på Nitropad och Nitrokey, om den är ansluten. Det är tillåtet att köra 10 bootar utan att förlora synkroniseringen mellan enheterna, varefter signalen för dålig kod visas, oavsett om resten av systemet är i korrekt tillstånd. Om du är säker på att systemet inte har manipulerats (t.ex. Nitropad har startats upp mer än 10 gånger utan Nitrokey) kan du säkert återställa systemets varning. Varje gång du startar NitroPad bör du - om möjligt - ansluta din Nitrokey. Om Nitrokey är inkopplad och systemet inte har ändrats visas följande skärm när NitroPad slås på. Ange lösenordet till ditt konto. Ange "PleaseChangeMe" som nuvarande lösenfras och välj en ny säker lösenfras. Generera ny TOTP/HOTP-hemlighet Komma igång Gå till fliken Enheter Nedan beskrivs hur uppstartsprocessen kan se ut om systemet har ändrats (t.ex. efter en uppdatering) och vilka felmeddelanden som annars kan uppstå. Om Qubes inte startar upp som visas nedan, utför följande steg: Om Ubuntu inte startar upp på det sätt som visas nedan kan du utföra följande steg: Om väskan eller skruvarna inte stämmer överens med de skickade bilderna kan det inte uteslutas att din NitroPad har öppnats utan tillstånd. Kontakta oss i så fall för att ordna ytterligare åtgärder. Om informationen på NitroPad inte stämmer överens med informationen på Nitrokey blir bakgrunden röd och meddelandet "Invalid Code" visas. Detta kan tyda på att manipulation har ägt rum. Om du har beställt enheten med alternativet "förseglade skruvar och förseglad påse", vänligen `verifiera förseglingen <verify-sealed-hardware.html>`__ innan du packar upp. Om du inte vet vad detta innebär kan du hoppa över det här avsnittet. Om du beställde din NitroPad med förseglade skruvar och i en förseglad påse kan du kontrollera om NitroPad har manipulerats under transporten. Om ikonen för Network Manager inte visas och när du startar en virtuell maskin visas ett fel som "Domain sys-net has failed to start: PCI-enhet dom0:03_00.0 finns inte" visas, fortsätt på följande sätt: Ogiltig kod Vänsterklicka på växlarna och välj "Change Passphrase" (Ändra lösenfras) från snabbmenyn. Därefter kommer systemet att be dig ange lösenfrasen för att dekryptera hårddisken. Lösenfrasen är inledningsvis "PleaseChangeMe". |bild3| NitroPad T430 NitroPad X230 med Qubes OS NitroPad X230 med Ubuntu Linux Öppna menyn -> Tjänst: sys-net -> sys-net: Qube-inställningar Öppna den förinstallerade Nitrokey-appen och ändra PIN-koderna för din Nitrokey enligt beskrivningen här. Alternativ Anslut Nitrokey och utför följande från startskärmen: Tryck på Enter ("Default Boot") efter att du startat upp systemet, förutsatt att NitroPad inte har visat några fel och att Nitrokey lyser grönt (se ovan). Ta bort "Okänd enhet" från höger sida. Starta om din bärbara dator och gå till Alternativ. |bild5| Förfarande för säker start Markera fältet med texten "Luks". Därefter ska det ha en orange bakgrund. Välj "Uppdatera kontrollsummor och signera alla filer på /boot". |image6| TPM/TOTP/HOTP-alternativ Därför är det viktigt att starta om NitroPad under kontrollerade förhållanden efter en systemuppdatering. Först när den nya statusen har bekräftats kan du lämna enheten obevakad igen. Annars kommer du inte att kunna skilja en eventuell attack från en systemuppdatering. Detaljerade instruktioner för en systemuppdatering kan `finnas här <https://docs.nitrokey.com/x230/qubes/system-update.html>`__. Därför är det viktigt att starta om NitroPad under kontrollerade förhållanden efter en systemuppdatering. Först när den nya statusen har bekräftats kan du lämna enheten obevakad igen. Annars kommer du inte att kunna skilja en eventuell attack från en systemuppdatering. Detaljerade instruktioner för en systemuppdatering kan `finnas här <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. NitroPad X230 kan också startas utan Nitrokey. Om du inte har Nitrokey med dig, men är säker på att hårdvaran inte har manipulerats, kan du starta upp systemet utan att kontrollera det. NitroPads fasta programvara kontrollerar vissa systemfiler för ändringar. Om ditt operativsystem har uppdaterat viktiga komponenter kommer du att bli varnad nästa gång du startar NitroPad. Det kan till exempel se ut så här: Påsen och alla skruvar på apparatens undersida har förseglats. För påsen och var och en av dessa skruvar har du fått ett foto via e-post. Fotona är orienterade så att batteriet ligger ovanpå. Den rödmarkerade rutan innehåller information om att BIOS inte har ändrats och att den delade hemligheten för NitroPad och Nitrokey stämmer överens. Denna information är dock inte tillräcklig, eftersom en angripare kan ha förfalskat den. Om Nitrokey samtidigt också blinkar grönt är allting bra. En angripare måste ha haft tillgång till NitroPad och Nitrokey för att uppnå detta resultat. Det är därför viktigt att du inte lämnar båda enheterna obevakade. Systemet guidar dig sedan genom processen för att skapa ett användarkonto. Därefter bör du ha startat upp systemet och redan kunna använda det normalt. Det här exemplet visar en förseglad skruv vars glitter representerar ett individuellt mönster. Om du vill ändra lösenfrasen för diskkryptering klickar du först på "Aktiviteter" i det övre vänstra hörnet och skriver in "disk" i sökfältet. Välj sedan programmet "Disks" som visas i mitten av skärmen. Felsökning Verifiering av förseglad hårdvara Kontrollera förseglad hårdvara Med NitroPad X230 kan skadliga ändringar av BIOS, operativsystem och programvara lätt upptäckas. Om du till exempel har lämnat din NitroPad på ett hotellrum kan du använda din Nitrokey för att kontrollera om den har manipulerats medan du var borta. Om en angripare ändrar NitroPads fasta programvara eller operativsystem kommer Nitrokey att upptäcka detta (instruktioner nedan). och följ anvisningarna på skärmen. Därefter bör både hemligheten och räknaren återställas till ett nytt värde. img |image1| |image2| |bild4| 