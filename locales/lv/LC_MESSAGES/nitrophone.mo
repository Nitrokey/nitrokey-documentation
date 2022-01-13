��    6      �              |  8   }  E   �  6   �  :   3  <   n  S   �  B   �  	   B     L  ]   ^  �   �  `   �     �  Q   
  m   \    �  F   �  *   )	  �   T	  i   $
     �
  -  �
  �   �     d  a   �  a   F    �  #  �  ;  �  
   $  
   /     :     J  j   Y  [   �  �      �   �     �  Y   �     �  H     �   U  �   �  �   �  T   u  ?  �  '  
  Q   2  )   �  �   �  �   C  T     z   b  :  �  8     N   Q  >   �  7   �  >      Z   V   F   �   	   �      !  w   !    �!  w   �"     #  Q   -#  w   #  (  �#  G    %  6   h%  �   �%  c   �&     �&  G  �&  �   >(  �   �(  c   `)  c   �)  0  (*  e  Y+  i  �-     )/  
   5/     @/  (   U/  p   ~/  ]   �/  �   M0  �   1     �1  U   2     l2  L   �2  �   �2  �   {3    h4  [   n5  A  �5  U  7  W   b8  )   �8  �   �8  �   m9  S   0:  �   �:   **Q:** Does the Nitrophone work with my carrier network? **Q:** How can I check, if my NitroPhone has been hacked/compromised? **Q:** What is a *Kill Switch* and how to activate it? **Q:** What is and how to activate *PIN Layout Scrambling* **Q:** Where can I get further information about GrapheneOS? **Q:** Why do I get "Warning: Your device is loading a different operating system"? *Long press on the respective app icon -> app info -> permissions* App Store Background Images Backup: The integrated backup (Seedvault) and Nextcloud. Choose Settings -> System -> Backup. Browser: The pre-installed browser Vanadium is hardened and therefore recommended for high security. For better ad blocking, `Bromite <https://github.com/bromite/bromite/releases/latest>`_ browser is recommended instead. By default you have a secure smartphone, already pre-installed with all the most necessary apps. Compatible Apps Contacts and calendar synchronization: DAVx5 supports CalDAV, CardDAV and WebCAL. Download all 5 files from `com.android.vending <https://apps.grapheneos.org/packages/com.android.vending/>`_. Earlier there was a list, but as the Play Service implementation progresses, most of the apps should work, although there are still some not working, a list will be available `here <https://github.com/Peter-Easton/GrapheneOS-Knowledge/tree/master/App%20Incompatibility%20List>`_. Email: K9-mail and OpenKeyChain (for OpenPGP encryption) or FairEmail. For more details, see the following pages: For very high security requirements, you should use as few apps as possible to provide a small attack surface. If instead you want to use the NitroPhone as an everyday smartphone with more apps we recommend: From the home screen, select: *Settings -> Apps -> Google Play services and disable battery optimization* Getting Started Google claims `all major carriers`_ should work with the Pixel phones. Nevertheless there might be exceptions, obviously we cannot check `all` carriers around the world. Best practice, is to check if you find some tests/experience stories about the Pixel 4a together with your planned carrier network. If the apps in F-Droid are not enough for you, open F-Droid and install Aurora Store. In Aurora Store, you can install all apps from Google Play Store. If you want to check the integrity of the operating system, you can use `remote verification <https://attestation.app/about>`_. Install `com.google.android.gms <https://apps.grapheneos.org/packages/com.google.android.gms/>`_. Install `com.google.android.gsf <https://apps.grapheneos.org/packages/com.google.android.gsf/>`_. Install the `F-Droid <https://f-droid.org/F-Droid.apk>`_ App Store. This has exclusively open source apps that do without drastic tracking and without advertising. Here you will find thousands of apps from a wide variety of fields. If you are looking for an app, check F-Droid first. Kill Switches, which erase all the phone's data when triggered, are very risky in practice as they could be triggered unintentionally. Therefore, the NitroPhone instead has the feature to automatically shut down and restart when inactive for a set period of time. This puts the phone in a secure state where all data is encrypted, no data is in RAM, and the phone can only be unlocked with the legitimate PIN or password. To enable, select: *Settings -> Security -> Auto reboot -> select the idle time duration after which the phone should reboot* Many apps work without Google Play Services. However, if you want to use apps that require Google Play Services, you can install `Google Play Services in a sandbox <https://grapheneos.org/usage#sandboxed-play-services>`_ as follows. In the future, an installer will be provided to simplify the installation process. Messenger: NitroPhone NitroPhone Apps NitroPhone FAQ One-time password generator (2FA, OTP): `Aegis Authenticator <https://github.com/beemdevelopment/Aegis>`_. Open F-Droid and install Split APKs Installer (SAI). (Also available from the Aurora Store) Open Split APKs Installer and install all five files you downloaded in step 3. **Note:** The correct base file has probably been renamed to ``base (2).apk``. Open the Google Play Store once and press "Sign in" to start the initialization. You don't have to finish the sign in and a real login is not necessary. This is solely to initialize the software. Permissions of Individual Apps Please familiarize yourself with `using your GrapheneOS <https://grapheneos.org/usage>`_. Recommended Apps Regarding camera app, see `here <https://grapheneos.org/usage#camera>`_. Set up a six-digit PIN to protect the phone. In cooperation with the security chip, this will ensure high security while maintaining good usability. Shortly after the phone is turned on, the warning "Your device is loading a different operating system" is displayed. This warning indicates that no ordinary Google Android is running and can be ignored. The Google Play Store cannot install and update apps due to the sandbox. Instead, always use F-Droid (for open source apps) or Aurora Store (for apps from Google Play Store) to install apps. To check or change the permissions on network access and sensors for a specific app: To make it difficult for strangers to read the PIN when typing it in, you can display the PIN layout in a random order. Additionally, we recommend a `privacy screen <https://shop.nitrokey.com/shop/product/privacyscreen-for-nitrophone-1-194>`_. To enable, select: *Settings -> Security -> PIN scrambling -> Scramble PIN* To prevent some apps from accessing Google Play Services, install Google Play Services in a separate profile. To do this, create a new dedicated user profile and install the Google Play Services there. Using a work profile together with *Shelter* is also possible, but without as much isolation. VPN: Orbot uses the free TOR network. Mullvad VPN and IVPN are paid VPN services. You can use these nice background images: `Briar <https://briarproject.org/>`_ is a peer-to-peer messenger without any server at all, which can be used without internet with contacts nearby. `Element <https://element.io/>`_ does not require a central infrastructure and allows the use of own servers. An own account can be registered for free at `NitroChat <https://nitro.chat>`_ for example. `Here <https://grapheneos.org/faq>`_ you can find further information on GrapheneOS. `Signal <https://signal.org/android/apk/>`_ is secure and now widely used. It can also be downloaded without an app store. Project-Id-Version: Nitrokey Documentation
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2022-01-05 12:32+0100
PO-Revision-Date: 2022-01-11 15:11+0000
Last-Translator: Anonymous <noreply@weblate.org>
Language: lv
Language-Team: Latvian <https://translate.nitrokey.com/projects/nitrokey-documentation/documentation-nitrophone/lv/>
Plural-Forms: nplurals=3; plural=(n % 10 == 0 || n % 100 >= 11 && n % 100 <= 19) ? 0 : ((n % 10 == 1 && n % 100 != 11) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 **K:** Vai Nitrophone darbojas ar mana operatora tīklu? **Q:** Kā es varu pārbaudīt, vai mans NitroPhone ir uzlauzts/kompromitēts? **Q:** Kas ir *Nogalināšanas slēdzis* un kā to aktivizēt? **Q:** Kas ir un kā aktivizēt *PIN Layout Scrambling* **Q:** Kur es varu iegūt papildu informāciju par GrapheneOS? **Q:** Kāpēc es saņemu "Brīdinājums: Jūsu ierīce ielādē citu operētājsistēmu"? *Long press uz attiecīgās lietotnes ikonas -> app info -> atļaujas* App Store Fona attēli Dublējums: Integrētais dublējums (Seedvault) un Nextcloud. Izvēlieties Iestatījumi -> Sistēma -> Rezerves kopija. Pārlūka: Iepriekš instalētā pārlūkprogramma Vanadium ir aizsargāta, tāpēc to ieteicams izmantot augstas drošības nolūkā. Labākai reklāmu bloķēšanai tā vietā ieteicams izmantot `Bromite <https://github.com/bromite/bromite/releases/latest>`_ pārlūkprogrammu. Pēc noklusējuma jums ir drošs viedtālrunis, kurā jau ir iepriekš instalētas visas nepieciešamākās programmas. Saderīgās lietotnes Kontaktu un kalendāra sinhronizācija: DAVx5 atbalsta CalDAV, CardDAV un WebCAL. Lejupielādējiet visus 5 failus no `com.android.vending <https://apps.grapheneos.org/packages/com.android.vending/>`_. Agrāk bija saraksts, bet, tā kā Play Service īstenošana turpinās, lielākajai daļai programmu vajadzētu darboties, lai gan dažas joprojām nedarbojas, saraksts būs pieejams `šeit <https://github.com/Peter-Easton/GrapheneOS-Knowledge/tree/master/App%20Incompatibility%20List>%20List>`_. E-pasts: K9-mail un OpenKeyChain (OpenPGP šifrēšanai) vai FairEmail. Sīkāku informāciju skatiet turpmākajās lappusēs: Ja ir ļoti augstas drošības prasības, jāizmanto pēc iespējas mazāk lietotņu, lai nodrošinātu nelielu uzbrukuma virsmu. Ja NitroPhone vēlaties izmantot kā ikdienas viedtālruni ar vairāk lietotnēm, mēs iesakām: Sākuma ekrānā izvēlieties: *Google Play pakalpojumi un atspējojiet akumulatora optimizāciju*. Darba sākšana Google apgalvo, ka `Visiem galvenajiem operatoriem`_ vajadzētu darboties ar Pixel tālruņiem. Tomēr var būt izņēmumi, acīmredzot mēs nevaram pārbaudīt `visus` operatorus visā pasaulē. Labākā prakse ir pārbaudīt, vai atrodat kādus testus/pieredzes stāstus par Pixel 4a kopā ar jūsu plānoto operatora tīklu. Ja ar F-Droid programmām nepietiek, atveriet F-Droid un instalējiet Aurora Store. Aurora veikalā varat instalēt visas programmas no Google Play veikala. Ja vēlaties pārbaudīt operētājsistēmas integritāti, varat izmantot `attālinātu pārbaudi <https://attestation.app/about>`_. Instalēt `com.google.android.gms <https://apps.grapheneos.org/packages/com.google.android.gms/>`_. Instalēt `com.google.android.gsf <https://apps.grapheneos.org/packages/com.google.android.gsf/>`_. Instalējiet `F-Droid <https://f-droid.org/F-Droid.apk>`_ App Store. Tajā ir tikai atvērtā pirmkoda programmas, kas darbojas bez drastiskas izsekošanas un bez reklāmām. Šeit atradīsiet tūkstošiem lietotņu no visdažādākajām jomām. Ja meklējat kādu lietotni, vispirms pārbaudiet F-Droid. Nogalināšanas slēdži, kas pēc aktivizēšanas dzēš visus tālruņa datus, praksē ir ļoti riskanti, jo tos var aktivizēt nejauši. Tāpēc NitroPhone tā vietā ir funkcija, kas automātiski izslēdzas un atkal ieslēdzas, ja noteiktu laiku ir neaktīvs. Tādējādi tālrunis nonāk drošā stāvoklī, kurā visi dati ir šifrēti, operatīvajā atmiņā nav datu un tālruni var atbloķēt tikai ar likumīgu PIN kodu vai paroli. Lai iespējotu, izvēlieties: *iestatījumus -> Drošība -> Automātiska pārstartēšana -> atlasiet dīkstāves laika ilgumu, pēc kura tālrunim būtu jāpārstartē*. Daudzas programmas darbojas bez pakalpojuma Google Play Services. Tomēr, ja vēlaties izmantot programmas, kurām nepieciešami Google Play pakalpojumi, varat instalēt `Google Play pakalpojumus smilšu kastē <https://grapheneos.org/usage#sandboxed-play-services>`_ šādi. Nākotnē tiks nodrošināts instalētājs, lai vienkāršotu instalēšanas procesu. Vēstnesis: NitroPhone NitroPhone lietotnes Bieži uzdotie jautājumi par NitroPhone Vienreizējas paroles ģenerators (2FA, OTP): `Aegis Authenticator <https://github.com/beemdevelopment/Aegis>`_. Atveriet F-Droid un instalējiet Split APK Installer (SAI). (Pieejams arī no Aurora veikala) Atveriet Split APK Installer un instalējiet visus piecus failus, kas lejupielādēti 3. solī. **Piezīme:** Pareizais bāzes fails, iespējams, ir pārdēvēts par ``base (2).apk``. Atveriet Google Play veikalu vienu reizi un nospiediet "Pierakstīties", lai sāktu inicializāciju. Jums nav jāpabeidz pierakstīties, un reāla pieteikšanās nav nepieciešama. Tas ir tikai un vienīgi, lai inicializētu programmatūru. Atsevišķu lietotņu atļaujas Lūdzu, iepazīstieties ar `, izmantojot GrapheneOS <https://grapheneos.org/usage>`_. Ieteicamās lietotnes Par kameras lietotni skatiet `šeit <https://grapheneos.org/usage#camera>`_. Iestatiet sešciparu PIN kodu, lai aizsargātu tālruni. Sadarbībā ar drošības mikroshēmu tas nodrošinās augstu drošību, vienlaikus saglabājot labu lietojamību. Neilgi pēc tālruņa ieslēgšanas tiek parādīts brīdinājums "Jūsu ierīcē tiek ielādēta cita operētājsistēma". Šis brīdinājums norāda, ka netiek darbināta parastā Google Android operētājsistēma, un to var ignorēt. "Google Play" veikalā nav iespējams instalēt un atjaunināt lietotnes, jo ir izveidots smilškastes logs. Tā vietā programmu instalēšanai vienmēr izmantojiet F-Droid (atvērtā pirmkoda programmām) vai Aurora Store (programmām no Google Play veikala). Lai pārbaudītu vai mainītu konkrētas lietotnes piekļuves tīklam un sensoru atļaujas: Lai svešiniekiem, ievadot PIN kodu, būtu grūti to izlasīt, varat PIN kodu izkārtojumu parādīt izlases kārtībā. Turklāt mēs iesakām `privātuma ekrānu <https://shop.nitrokey.com/shop/product/privacyscreen-for-nitrophone-1-194>`_. Lai to iespējotu, izvēlieties: *PIN kodu kodēšanu -> Skramblēt PIN kodu*. Lai dažām programmām liegtu piekļuvi pakalpojumam Google Play Services, instalējiet pakalpojumu Google Play Services atsevišķā profilā. Lai to izdarītu, izveidojiet jaunu īpašu lietotāja profilu un tajā instalējiet Google Play Services. Ir iespējams izmantot arī darba profilu kopā ar *Shelter*, taču tas nav tik izolēts. VPN: Orbot izmanto bezmaksas TOR tīklu. Mullvad VPN un IVPN ir maksas VPN pakalpojumi. Varat izmantot šos jaukos fona attēlus: `Briar <https://briarproject.org/>`_ ir peer-to-peer ziņnesis bez servera, ko var izmantot bez interneta, izmantojot kontaktus tuvumā. `Elements <https://element.io/>`_ neprasa centrālo infrastruktūru un ļauj izmantot savus serverus. Savu kontu var reģistrēt bez maksas, piemēram, vietnē `NitroChat <https://nitro.chat>`_. `Tur <https://grapheneos.org/faq>`_ var atrast papildu informāciju par GrapheneOS. `Signāls <https://signal.org/android/apk/>`_ ir drošs un pašlaik plaši izmantots. To var lejupielādēt arī bez lietotņu veikala. 