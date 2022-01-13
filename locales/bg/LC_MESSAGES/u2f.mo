��    d      <              \     ]     y     �  3   �  7   �          9     R  	   r  5   |  G   �  �   �  ]   �  {   	     �	     �	     �	    �	  
   �
     �
            6   -  +   d  �   �  
   ,  �   7  b    �   q  �   :  A  �  �   (  �   �  �   <  �   �  N   �  i   #     �     �  �   �  �   Y     8     J     g     �  �   �  �   1  Z     �   w  D     )   R  �   |  �   >  P   �     :  �   F     2  )   ?  L   i  �   �  ;   C  ;     �   �  2   c  >   �    �  d   �   �   X!  �   �!  �  �"    Y$  Q   w%  �   �%  �   �&  �   j'  =  �'  �   0)  M   �)     D*     T*  /   t*  (   �*  :   �*     +  C   +  &   R+  �   y+  o   *,  �   �,  ~   *-  �   �-  -   8.  C  f.  1  �/  �   �0  �   �1    �2  }   �3  �   4  �  �4     �6     �6     7  t   7  H   �7  (   �7  /   8  O   68     �8  H   �8  v   �8  ,  e9  �   �:  �   ;  2   �;  ,   0<  7   ]<  �  �<     Y>  @   h>  -   �>  !   �>  X   �>  r   R?  "  �?  5   �@  z  A  �  �B  �  sD     F  �  G  �   �I  �   �J  ?  xK  �  �L  m   BN  �   �N     iO     ~O  4  �O  �  �P     IR     [R     vR     �R  �   �R  �  cS  �   U    �U  �   �V  [   NW  E  �W  '  �X  �   Z     �Z  �  �Z     =\  M   R\  �   �\    )]  [   F^  ]   �^  �    _  X   �_  [   J`    �`  �   �b    �c  �  �d  �  !f  �  i  �   �j    �k  _  �l    #n    )o  [  >q  �   �r  8   7s  9   ps  P   �s  &   �s  E   "t     ht  \   yt  Y   �t  (  0u  �   Yv    w  �   /x  �   y  4   �y  b  z  �  u|  S  i~  @  �  �  ��  �   ��  �  r�   (Nitrokey FIDO U2F - Linux) (Nitrokey FIDO U2F - Windows) (Nitrokey FIDO U2F - macOS) 1. Create a backup user and give it root privileges 2. Set up the ``rules`` to recognize the Nitrokey FIDO2 3. Install ``libpam-u2f`` 4. Prepare the Directory 5. Generate the U2F config file 6. Backup 7. Modify the Pluggable Authentication Module ``PAM`` After copying the file, restart udev via ``sudo service udev restart``. After the PAM module modification, you will be able to test your configuration right away, but it is recommended to reboot your computer, and unplug/replug the Nitrokey FIDO2. Alternatively you can build ``libpam-u2f`` from `Git <https://github.com/phoeagon/pam-u2f>`_. Alternatively you can just modify the ``/etc/pam.d/sudo`` file if you wish to use FIDO U2F when using the ``sudo`` command. And add the following lines: And plug your Nitrokey FIDO2. And restart ``udev`` service By modifying ``/etc/pam.d/common-auth`` file, you will be able to use you Nitrokey FIDO for 2nd factor authentication for graphic login and ``sudo``. Note: ``common-auth`` should be modified by adding the additional configuration line at the end of the file. CLI method Choose your operating system: Click for more options Control flags Create ``.config/Nitrokey/`` under your home directory Desktop Login and Linux User Authentication For individual user configuration you should point to the home directory in the next step, or not include the ``authfile`` option in the PAM configuration. GUI method If ``required`` or ``requisite`` is set, the failure of U2F authentication will cause a failure of the overall authentication. Failure will occur when the configured Nitrokey FIDO is not plugged, lost or destroyed. If the Nitrokey is not accepted immediately, you may need to copy this file `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`_ to ``etc/udev/rules.d/``. In very rare cases, the system will need the `older version <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`_ of this file. If you need more information about Control Flags in the ``PAM`` configuration line, you may see the last section of this guide to understand the difference, and the implications of using each of them. If you often forget to insert the key, ``prompt`` option make ``pam_u2f`` print ``Insert your U2F device, then press ENTER.`` and give you a chance to insert the Nitrokey. If you want to login to you computer using `Nitrokey Pro 2, <https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3>`_ `Nitrokey Storage 2 <https://shop.nitrokey.com/shop/product/nitrokey-storage-2-56>`_ and `Nitrokey Start <https://shop.nitrokey.com/shop/product/nk-sta-nitrokey-start-6>`_ you can visit the instructions for Windows available `here <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:windows>`_, and for Linux `here <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:linux>`_. If you wish to use FIDO U2F authentication solely for Gnome’s graphic login, you might prefer to modify the\ ``/etc/pam.d/gdm-password`` If you would like to be prompted to touch the Nitrokey, ``cue`` option will make ``pam_u2f`` print ``Please touch the device.`` message. In case you prefer to setup U2F for a single user, and are locked out of your user session, you would still be able to login with the ``<backup_user>``, and proceed with the maintenance. In step 7 we have used the ``sufficient`` control flag to determine the behavior of the PAM module when the Nitrokey is plugged or not. However it is possible to change this behavior by using the following control flags: In the left corner click on ``Unlock`` and that would prompt for your password In the lower left corner click on ``Show Applications`` and type settings in the search bar as following: Instructions Introduction It is recommended to first test the instructions with a single user. For this purpose the previous command takes the ``-u`` option, to specify a user, like in the example below: Log in to the website and enable two-factor authentication in your account settings. (In most cases you will find a link to the documentation of the supported web service at `dongleauth.com <https://www.dongleauth.com/>`_) Nitrokey FIDO U2F Nitrokey FIDO U2F with Linux Nitrokey FIDO U2F with Windows Nitrokey FIDO U2F with macOS Nitrokey FIDO2 configured following `these instructions <https://www.nitrokey.com/documentation/installation#p:nitrokey-fido-u2f&os:linux>`_. Note, the output will be much longer, but sensitive parts have been removed here. For better security, and once the config file generated, we will move the ``.config/Nitrokey`` directory under the ``etc/`` directory with this command: On Ubuntu 20.04 it is possible to download directly ``libpam-u2f`` from the official repos Once done with the preparation, we can start to configure the computer to use the Nitrokey FIDO2 for 2nd factor authentication at login and ``sudo``. Once we modified the ``common-auth``, we can save and exit the file. Once you finish Step 4 you should be done Once you have properly tested the instructions in this guide (and set up a backup), it is recommended to use either the ``required`` or the ``requisite`` control flag instead of ``sufficient``. Once you run the command above, you will need to touch the key while it flashes. Once done, ``pamu2fcfg`` will append its output the ``u2f_keys`` in the following format: Open one of the `websites that support FIDO U2F <https://www.dongleauth.com/>`_. PAM modules Register your Nitrokey FIDO U2F in the account settings by touching the button to activate the Nitrokey FIDO U2F. After you have successfully configured the device, you must activate the Nitrokey FIDO U2F this way each time you log in. Requirements Scroll down in the right bar to ``Users`` Select ``Administrator`` and enter the user name and password of your choice Since we are using Central Authentication Mapping, we need to tell ``pam_u2f`` the location of the file to use with the ``authfile`` option. The Nitrokey App can not be used for the Nitrokey FIDO U2F. The Nitrokey FIDO U2F can be used with any current browser. The Nitrokey FIDO U2F supports **two-factor authentication (2FA)**. With two-factor authentication (2FA), the Nitrokey FIDO U2F is checked in addition to the password. The Output should be something like the following: The file under ``.config/Nitrokey`` must be named ``u2f_keys`` The final step is configure the PAM module files under ``/etc/pam.d/``. In this guide we will modify the ``common-auth`` file as it handles the authentication settings which are common to all services, but other options are possible. You can modify the file with the following command: The first time you plug in the Nitrokey FIDO U2F Windows may need some time to configure the device. The flags ``required`` and ``requisite`` provide a tighter access control, and will make the Nitrokey FIDO2 necessary to login, and/or use the configured service. The following guide can potentially lock you out of your computer. You should be aware of these risks, as it is recommended to first use the instructions below on a secondary computer, or after a full backup. The secure access to such a central software is especially important and can now be realized with the Nitrokey. For this purpose, access is protected by two-factor authentication (2FA) and critical users are given a Nitrokey. From now on the Nitrokey will be checked during user login in addition to the user password. Phishing attacks are thus foiled and your critical company data is protected. The two-factor authentication can be carried out using one-time passwords (TOTP, RFC 6238) and FIDO U2F, thus enabling Nitrokey Pro, Nitrokey Storage and Nitrokey FIDO U2F to be used. It is also possible to configure authentication centrally and to activate it only for selected users. There are several PAM modules files that can be modified according to your needs: This guide will walk you through the configuration of Linux to use FIDO Universal 2nd Factor, i.e. FIDO U2F with ``libpam-u2f`` and `Nitrokey FIDO2 <https://shop.nitrokey.com/shop/product/nk-fi2-nitrokey-fido2-55>`_. This solution was developed together with our partner `initOS <https://www.initos.com/>`_, who are specialized in the development and customization of Odoo. If you are interested, please contact us. This step is optional, however it is advised to have a backup Nitrokey in the case of loss, theft or destruction of your Nitrokey FIDO. To generate the configuration file we will use the ``pamu2fcfg`` utility that comes with the ``libpam-u2f``. For convenience, we will directly write the output of the utility to the ``u2f_keys`` file under ``.config/Nitrokey``. First plug your Nitrokey FIDO2 (if you did not already), and enter the following command: To set up a backup key, repeat the procedure above, and use ``pamu2fcfg -n``. This will omit the ``<username>`` field, and the output can be appended to the line with your ``<username>`` like this: To verify that the library is properly installed enter the following command: Troubleshooting Two-Factor Authentication (2FA) Two-factor authentication for ERP software Odoo Ubuntu 20.04 with Gnome Display Manager. Under ``/etc/udev/rules.d`` download ``41-nitrokey.rules`` Usage Video: Two-Factor-Authentication with the Nitrokey FIDO U2F in Odoo You can do so by using these commands: You can test the configuration by typing ``sudo ls`` in the terminal. You should be prompted the message ``Please touch the device.`` and have a similar output on the terminal: You might lose access to your data after configuring `PAM modules <http://www.linux-pam.org/Linux-PAM-html/>`_. You will also lose the ability to use ``sudo`` if you set up Central Authentication Mapping *and* used the ``required`` or ``requisite`` flags. You will lose access to your computer if you mis-configured the PAM module *and* used the ``required`` or ``requisite`` flags. `Checkout <https://www.nitrokey.com/documentation/applications#p:nitrokey-fido-u2f&os:all>`_ the various use cases and supported applications. `Contact <https://www.nitrokey.com/contact>`_ `Odoo <https://www.odoo.com/>`_ is a powerful ERP (Enterprise Resource Planning) software for companies of all sizes. Odoo is available as open source and contains modules for CRM, website/e-commerce, accounting, financial accounting, production, warehouse management, project management, document management, among others. ``bash nitrouser@nitrouser:~$ sudo ls $ sudo ls [sudo] password for <username>:  Please touch the device.`` You can also test your configuration by logging out of the user session and logging back. A similar screen should be displayed once you you unplug/replug yout Nitrokey FIDO2 and type your password: ``optional``: The success or failure of this module is only important if it is the only module in the stack associated with this service+type. The ``optional`` flag is considered to be safe to use for testing purposes. ``required``: This is the most critical flag. The module result must be successful for authentication to continue. This flag can lock you out of your computer if you do not have access to the Nitrokey. ``requisite``: Similar to ``required`` however, in the case where a specific module returns a failure, control is directly returned to the application, or to the superior PAM stack. This flag can also lock you out of your computer if you do not have access to the Nitrokey. ``sufficient``: The module result is ignored if it fails. The ``sufficient`` flag considered to be safe for testing purposes. `nouserok` will ensure that you can still login using the username and password, you might want to remove this at some point once the setup is working and you don't want regular username & password based logins. Project-Id-Version: Nitrokey Documentation
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2022-01-05 12:32+0100
PO-Revision-Date: 2022-01-11 11:10+0000
Last-Translator: Ben (Weblate Admin) <ben@dotplex.com>
Language: bg
Language-Team: Bulgarian <https://translate.nitrokey.com/projects/nitrokey-documentation/documentation-u2f/bg/>
Plural-Forms: nplurals=2; plural=n != 1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 (Nitrokey FIDO U2F - Linux) (Nitrokey FIDO U2F - Windows) (Nitrokey FIDO U2F - macOS) 1. Създайте потребител за архивиране и му дайте привилегии на root 2. Настройте ``rules`` да разпознава Nitrokey FIDO2 3. Инсталиране ``libpam-u2f`` 4. Подготовка на указателя 5. Генериране на конфигурационния файл на U2F 6. Резервно копие 7. Модифициране на Pluggable Authentication Module ``PAM`` След като копирате файла, рестартирайте udev чрез ``sudo service udev restart``. След модификацията на модула PAM ще можете да тествате конфигурацията си веднага, но е препоръчително да рестартирате компютъра си и да изключите/завържете Nitrokey FIDO2. Като алтернатива можете да изградите ``libpam-u2f`` от `Git <https://github.com/phoeagon/pam-u2f>`_. Алтернативно можете просто да промените файла ``/etc/pam.d/sudo``, ако желаете да използвате FIDO U2F, когато използвате командата ``sudo``. И добавете следните редове: И включете своя Nitrokey FIDO2. И рестартирайте ``udev`` услугата Чрез модифициране на файла ``/etc/pam.d/common-auth`` ще можете да използвате Nitrokey FIDO за втори фактор на удостоверяване за графично влизане и ``sudo``. Забележка: ``common-auth`` трябва да се модифицира, като се добави допълнителният конфигурационен ред в края на файла. Метод CLI Изберете операционната си система: Щракнете за повече опции Контролни флагове Създаване на ``.config/Nitrokey/`` в домашната директория Влизане в работния плот и удостоверяване на потребителя на Linux За конфигурация на отделни потребители трябва да посочите домашната директория в следващата стъпка или да не включвате опцията ``authfile`` в конфигурацията на PAM. Метод на графичния интерфейс Ако е зададено ``required`` или ``requisite``, неуспехът на U2F удостоверяването ще доведе до неуспех на цялостното удостоверяване. Неуспехът ще настъпи, когато конфигурираният Nitrokey FIDO не е включен, изгубен или унищожен. Ако Nitrokey не бъде приет веднага, може да се наложи да копирате този файл `41-nitrokey.rules <https://www.nitrokey.com/sites/default/files/41-nitrokey.rules>`_ на ``etc/udev/rules.d/``. В много редки случаи системата ще се нуждае от `старата версия <https://raw.githubusercontent.com/Nitrokey/libnitrokey/master/data/41-nitrokey_old.rules>`_ на този файл. Ако имате нужда от повече информация за контролните флагове в конфигурационния ред ``PAM``, можете да видите последния раздел на това ръководство, за да разберете разликата и последиците от използването на всеки от тях. Ако често забравяте да поставите ключа, ``prompt`` опцията прави ``pam_u2f`` да отпечатва ``Insert your U2F device, then press ENTER.`` и ви дава възможност да поставите ключа Nitro. Ако искате да влезете в компютъра си с помощта на `Nitrokey Pro 2, <https://shop.nitrokey.com/shop/product/nk-pro-2-nitrokey-pro-2-3>`_ `Nitrokey Storage 2 <https://shop.nitrokey.com/shop/product/nitrokey-storage-2-56>`_ и `Nitrokey Start <https://shop.nitrokey.com/shop/product/nk-sta-nitrokey-start-6>`_ можете да посетите инструкциите за Windows, налични `тук <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:windows>`_, и за Linux `тук <https://www.nitrokey.com/documentation/applications#p:nitrokey-pro&a:computer-login&os:linux>`_. Ако желаете да използвате удостоверяването FIDO U2F само за графичното влизане в Gnome, може да предпочетете да промените\ ``/etc/pam.d/gdm-password`` Ако искате да бъдете подканени да докоснете ключа Nitrokey, ``cue`` опцията ще направи ``pam_u2f`` печат на ``Please touch the device.`` съобщение. В случай че предпочитате да настроите U2F за един потребител и сте блокирани от потребителската си сесия, все пак ще можете да влезете с ``<backup_user>`` и да продължите с поддръжката. В стъпка 7 използвахме контролния флаг ``sufficient``, за да определим поведението на модула PAM, когато ключът Nitrokey е включен или не. Възможно е обаче да промените това поведение, като използвате следните контролни флагове: В левия ъгъл щракнете върху ``Unlock`` и ще поискате паролата си. В долния ляв ъгъл кликнете върху ``Show Applications`` и въведете настройки в лентата за търсене, както следва: Инструкции Въведение Препоръчително е инструкциите да се тестват първо с един потребител. За тази цел предишната команда приема опцията ``-u``, за да посочи потребител, както в примера по-долу: Влезте в уебсайта и активирайте двуфакторното удостоверяване в настройките на профила си. (В повечето случаи ще намерите връзка към документацията на поддържаната уеб услуга на адрес `dongleauth.com <https://www.dongleauth.com/>`_) Nitrokey FIDO U2F Nitrokey FIDO U2F с Linux Nitrokey FIDO U2F с Windows Nitrokey FIDO U2F с macOS Конфигуриране на Nitrokey FIDO2 съгласно `тези инструкции <https://www.nitrokey.com/documentation/installation#p:nitrokey-fido-u2f&os:linux>`_. Обърнете внимание, че изходът ще бъде много по-дълъг, но тук са премахнати чувствителните части. За по-добра сигурност и след като генерираме файла с конфигурацията, ще преместим директорията ``.config/Nitrokey`` под директорията ``etc/`` с тази команда: В Ubuntu 20.04 е възможно да изтеглите директно ``libpam-u2f`` от официалните хранилища След като приключим с подготовката, можем да започнем да конфигурираме компютъра да използва Nitrokey FIDO2 за удостоверяване на втори фактор при влизане и ``sudo``. След като сме модифицирали ``common-auth``, можем да запишем и да излезем от файла. След като завършите стъпка 4, трябва да сте готови. След като сте тествали правилно инструкциите в това ръководство (и сте създали резервно копие), се препоръчва да използвате или ``required``, или ``requisite`` контролен флаг вместо ``sufficient``. След като изпълните горната команда, трябва да докоснете клавиша, докато той мига. След като го направите, ``pamu2fcfg`` ще добави към изхода си ``u2f_keys`` в следния формат: Отворете един от `уебсайтовете, които поддържат FIDO U2F <https://www.dongleauth.com/>`_. Модули PAM Регистрирайте своя Nitrokey 3 в настройките на профила, като докоснете бутона за активиране на Nitrokey 3. След като сте конфигурирали успешно устройството, трябва да активирате Nitrokey 3 по този начин при всяко влизане в системата. Изисквания Превъртете надолу в дясната лента до ``Users`` Изберете ``Administrator`` и въведете избраните от вас потребителско име и парола. Тъй като използваме Централно картографиране за удостоверяване, трябва да посочим ``pam_u2f`` местоположението на файла, който да се използва с опцията ``authfile``. Приложението Nitrokey не може да се използва за Nitrokey 3. Nitrokey 3 може да се използва с всеки актуален браузър. Nitrokey FIDO U2F поддържа **двуфакторно удостоверяване (2FA)**. При двуфакторното удостоверяване (2FA) освен паролата се проверява и Nitrokey FIDO U2F. Изходът трябва да бъде нещо подобно на следното: Файлът под ``.config/Nitrokey`` трябва да бъде с име ``u2f_keys``. Последната стъпка е конфигурирането на файловете на модула PAM в ``/etc/pam.d/``. В това ръководство ще модифицираме файла ``common-auth``, тъй като той обработва настройките за удостоверяване, които са общи за всички услуги, но са възможни и други варианти. Можете да промените файла със следната команда: Когато включите Nitrokey FIDO U2F за първи път, на Windows може да е необходимо известно време, за да конфигурира устройството. Флаговете ``required`` и ``requisite`` осигуряват по-строг контрол на достъпа и правят Nitrokey FIDO2 необходим за влизане и/или използване на конфигурираната услуга. Следното ръководство може да ви блокира достъпа до компютъра. Трябва да сте наясно с тези рискове, тъй като се препоръчва инструкциите по-долу да се използват първо на вторичен компютър или след пълно архивиране. Сигурният достъп до такъв централен софтуер е особено важен и сега може да бъде осъществен с Nitrokey. За тази цел достъпът е защитен чрез двуфакторно удостоверяване (2FA), а на критичните потребители се предоставя Nitrokey. Отсега нататък Nitrokey ще се проверява при влизане на потребителя в допълнение към потребителската парола. По този начин се предотвратяват фишинг атаки и се защитават критичните данни на вашата компания. Двуфакторното удостоверяване може да се извършва с еднократни пароли (TOTP, RFC 6238) и FIDO U2F, което позволява използването на Nitrokey Pro, Nitrokey Storage и Nitrokey FIDO U2F. Възможно е също така удостоверяването да се конфигурира централно и да се активира само за избрани потребители. Съществуват няколко файла с модули на PAM, които могат да бъдат модифицирани според вашите нужди: Това ръководство ще ви запознае с конфигурацията на Linux за използване на FIDO Universal 2nd Factor, т.е. FIDO U2F с ``libpam-u2f`` и `Nitrokey FIDO2 <https://shop.nitrokey.com/shop/product/nk-fi2-nitrokey-fido2-55>`_. Това решение беше разработено съвместно с нашия партньор `initOS <https://www.initos.com/>`_, който е специализиран в разработването и персонализирането на Odoo. Ако проявявате интерес, моля, свържете се с нас. Тази стъпка не е задължителна, но е препоръчително да имате резервен ключ Nitrokey в случай на загуба, кражба или унищожаване на вашия FIDO ключ Nitrokey. За да генерираме конфигурационния файл, ще използваме ``pamu2fcfg`` помощната програма, която се доставя с ``libpam-u2f``. За удобство ще запишем директно изхода на полезната програма във файла ``u2f_keys`` под ``.config/Nitrokey``. Първо включете своя Nitrokey FIDO2 (ако вече не сте го направили) и въведете следната команда: За да настроите резервен ключ, повторете процедурата по-горе и използвайте ``pamu2fcfg -n``. Това ще пропусне полето ``<username>`` и изходът може да бъде добавен към реда с вашия ``<username>`` по следния начин: За да проверите дали библиотеката е правилно инсталирана, въведете следната команда: Отстраняване на неизправности Двуфакторно удостоверяване (2FA) Двуфакторно удостоверяване за ERP софтуер Odoo Ubuntu 20.04 с Gnome Display Manager. Под ``/etc/udev/rules.d`` изтегляне ``41-nitrokey.rules`` Употреба Видео: Двуфакторно удостоверяване с Nitrokey FIDO U2F в Odoo Можете да го направите с помощта на тези команди: Можете да тествате конфигурацията, като въведете ``sudo ls`` в терминала. Трябва да ви бъде изведено съобщението ``Please touch the device.`` и да имате подобен изход на терминала: Възможно е да загубите достъп до данните си след конфигуриране на `PAM модули <http://www.linux-pam.org/Linux-PAM-html/>`_. Ще загубите и възможността да използвате ``sudo``, ако настроите Централно картографиране на удостоверяването *и* сте използвали флаговете ``required`` или ``requisite``. Ще загубите достъп до компютъра си, ако сте конфигурирали неправилно модула PAM *и* сте използвали флаговете ``required`` или ``requisite``. `Каса <https://www.nitrokey.com/documentation/applications#p:nitrokey-fido-u2f&os:all>`_ различните случаи на употреба и поддържаните приложения. `Контакт <https://www.nitrokey.com/contact>`_ `Odoo <https://www.odoo.com/>`_ е мощен софтуер за планиране на ресурсите на предприятието (ERP) за компании от всякакъв мащаб. Odoo се предлага като софтуер с отворен код и съдържа модули за CRM, уебсайт/електронна търговия, счетоводство, финансово счетоводство, производство, управление на складове, управление на проекти, управление на документи и др. ``bash nitrouser@nitrouser:~$ sudo ls $ sudo ls [sudo] password for <username>:  Please touch the device.`` Можете също така да тествате конфигурацията си, като излезете от потребителската сесия и влезете отново. Подобен екран трябва да се покаже, след като изключите/включите отново вашия Nitrokey FIDO2 и въведете паролата си: ``optional``: Успехът или неуспехът на този модул е важен само ако той е единственият модул в стека, свързан с този тип услуга+. Флагът ``optional`` се счита за безопасен за използване с цел тестване. ``required``: Това е най-критичният флаг. Резултатът от модула трябва да е успешен, за да продължи удостоверяването. Този флаг може да ви блокира компютъра, ако нямате достъп до Nitrokey. ``requisite``: Подобно на ``required``, но в случай че конкретен модул върне отказ, контролът се връща директно към приложението или към по-горния стек на PAM. Този флаг може също така да ви блокира компютъра, ако нямате достъп до Nitrokey. ``sufficient``: Резултатът от модула се пренебрегва, ако е неуспешен. Флагът ``sufficient`` се счита за безопасен за целите на тестването. `nouserok` ще гарантира, че все още можете да влизате в системата, като използвате потребителското име и паролата, но може да искате да премахнете това в даден момент, след като настройката заработи и не искате редовни влизания, базирани на потребителско име и парола. 