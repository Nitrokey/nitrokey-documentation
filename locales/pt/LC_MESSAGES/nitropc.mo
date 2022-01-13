��    :      �              �  9   �     �          !  �   8  L   5  �   �  �     N   �  L   �  D   G  �   �  c   H  M   �  /  �  �   *
  �   �
  8  �  G   �  #   	     -  �   >     �    �  �   �  �   �  ]     z   {  ?   �  �   6     �     �     �          '  �   ;  C     C   O     �  �   �     ]     }  �   �  �   �  >     �   G  Q   	  S   [  �   �  #   J     n  W   �  I   �     '  0   C  ?   t      �  �  �  @   �     �  &         7    X  N   m  �   �  �   W  O      R   P  C   �  �   �  b   �   T   !  >  a!  �   �"  �   �#  U  $  ]   o%  ,   �%     �%  �   &     �&  "  �&  �   �'  �   �(  i   :)  �   �)  @   ;*  �   |*     F+     N+     Z+     m+     �+  �   �+  U   ^,  D   �,  %   �,  �   -  /   �-     �-  .  .  �   A/  B   �/  �   	0  T   �0  X   91  �   �1  #   12     U2  W   q2  W   �2  #   !3  8   E3  @   ~3  %   �3   **Q:** What is the default hard-disk encryption password? Boot Entry Has Changed Boot Hash Mismatch Booting from USB drive Booting this USB drive entirely erases all data on the hard disk or SSD of the NitroPad without further warning. Don’t boot this USB drive on any computer which contains data you want to keep. Make sure to format the USB drive after the intended use. Change the passphrase for disk encryption by opening a terminal and execute: Check each screw individually to see if its individual appearance matches the photo. It is best to use a magnifying glass or macro lens for this purpose. Confirm the message with Enter to have the files changed by the system update verified. Afterwards you will be asked again for a confirmation. Confirm the question "Do you wish to add a disk encryption to the TPM" with N. Confirm the question "Please confirm that your GPG card is inserted" with Y. Confirm the question "Saving a default will modify the disk" with Y. Connect the USB drive to a black USB 2.0 socket (blue USB 3.0 don't work!), start the PC and keep pressing DEL until you see the firmware menu. Choose Boot Menu and select your USB drive. Connect the USB drive to your NitroPad and start it. In Heads menu select Boot Options -> USB Boot. Depending on the operating system you may need to confirm its reinstallation. Download one of the operating system images: `Ubuntu Linux <https://www.nitrokey.com/files/ci/nitropc/ubuntu-oem/>`_, `Qubes OS <https://www.nitrokey.com/files/ci/nitropc/qubes-oem/>`_, `Debian <https://www.nitrokey.com/files/ci/nitropc/debian-oem/>`_, `Linux Mint <https://linuxmint.com/download.php>`_ During boot of the system the error "Failed to start Load Kernel Modules" is displayed. `This is a known issue <https://github.com/QubesOS/qubes-issues/issues/2638>`_ which is not critical and can be ignored. During boot, the system will prompt you to enter the passphrase to decrypt the hard disk. Enter the default passphrase “PleaseChangeMe”. During boot, the system will prompt you to enter the passphrase to decrypt the hard disk. Enter the default passphrase “PleaseChangeMe”. The system will then guide you through the process of creating a user account. After that you should have successfully booted the system and could already use it normally. Enter the User PIN of the Nitrokey whenever prompted (default: 123456). Failed to start Load Kernel Modules First check the: First confirm the error message shown above. Then we see a list of all possible boat entries - choose the first one by simply pressing Enter. Getting Started Heads expects an English keyboard layout, on which e.g. “y” and “z” are swapped in comparison to the German keyboard layout. If you agree with the default selection (which is written in capital letter) you can also simply confirm by pressing Enter. If the bag or the screws do not match the photos sent, an unauthorized opening of your NitroPC cannot be excluded. In this case please contact us to arrange further action. If you ordered your NitroPC with sealed screws and in a sealed bag, it allows you to check if the NitroPC has been tampered with during shipping. If you press Enter afterwards, you will get an error message that looks like this or similar: If you restart the NitroPad after an update, the startup screen should initially appear as usual without an error message. Linux: ``dd``, `balenaEtcher <https://www.balena.io/etcher/>`_; Next, either another error message appears or the operating system starts. This depends on the system update. If the following error message appears, proceeds as described below: NitroPC NitroPC FAQ NitroPC with Debian NitroPC with Qubes OS NitroPC with Ubuntu Now insert the Nitrokey if this is not already the case and confirm with Enter. Then you must enter the User PIN of the Nitrokey (default: 123456). You will not see the characters you typed in on the screen. Now the NitroPad marks the files changed by the update as verified. Now the Nitrokey has to be plugged in, if this is not yet the case. Operating System Reinstallation Optional: Download hash sum and `verify <https://proprivacy.com/guides/how-why-and-when-you-should-hash-check#how-to-hash-check>`_ the downloaded operating system image. Procedure After a System Update System update The NitroPad watches for changes to important system files to detect third-party tampering. This means that special steps are sometimes necessary when updating the system. This can often be recognized by the fact that the system prompts you to reboot. The bag and all screws of the device have been sealed. For the bag and each of these screws you have received a photo by e-mail. The default NitroPC disk encryption password: "PleaseChangeMe" The system has a user account setup already. Choose it and login with the default passphrase "PleaseChangeMe". You may keep using the existing user account or create you a new one, as you like. This example shows a sealed screw whose glitter represents an individual pattern. To avoid accidential overwriting of valuable data, format the USB drive afterwards. To save this value as default, select the option “Make Ubuntu the default” for Ubuntu or “Make Qubes the default” for Qubes OS in the next window. Using WIFI (with RTL8821ce chipset) Verify Sealed Hardware Windows: `Rufus <https://rufus.ie/>`_, `balenaEtcher <https://www.balena.io/etcher/>`_; Write the operating system image to any USB drive. Possible applications: Your system will then boot. `Sign the boot partition. <system-update.html>`_ macOS: ``dd``, `balenaEtcher <https://www.balena.io/etcher/>`_. or choose your operating system: Project-Id-Version: Nitrokey Documentation
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2022-01-05 12:32+0100
PO-Revision-Date: 2022-01-11 15:11+0000
Last-Translator: Anonymous <noreply@weblate.org>
Language: pt
Language-Team: Portuguese <https://translate.nitrokey.com/projects/nitrokey-documentation/documentation-nitropc/pt/>
Plural-Forms: nplurals=2; plural=n > 1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 **Q:** Qual é a senha padrão de criptografia do disco rígido? A Entrada no Boot Mudou Descoordenação do Boot Hash Mismatch Arrancar a partir da unidade USB A inicialização desta unidade USB apaga completamente todos os dados no disco rígido ou SSD do NitroPad sem mais avisos. Não arranque esta unidade USB em nenhum computador que contenha dados que queira guardar. Certifique-se de formatar o drive USB após o uso pretendido. Altere a frase-chave para criptografia de disco abrindo um terminal e execute: Verifique cada parafuso individualmente para ver se a sua aparência individual corresponde à foto. É melhor usar uma lupa ou lente macro para este fim. Confirmar a mensagem com Enter para que os arquivos sejam modificados pela atualização do sistema. Em seguida, você será solicitado novamente por uma confirmação. Confirme a pergunta "Deseja adicionar uma encriptação de disco ao TPM" com N. Confirme a pergunta "Por favor confirme que seu cartão GPG está inserido" com Y. Confirmar a pergunta "Salvar um padrão modificará o disco" com Y. Ligue a unidade USB a uma tomada USB 2.0 preta (USB azul 3.0 don't work!), inicie o PC e continue a pressionar DEL até ver o menu do firmware. Escolha o menu Boot e seleccione o seu drive USB. Ligue a unidade USB ao seu NitroPad e inicie-o. No menu Heads seleccione Boot Options -> USB Boot. Dependendo do sistema operacional, você pode precisar confirmar sua reinstalação. Faça o download de uma das imagens do sistema operacional: `Ubuntu Linux <https://www.nitrokey.com/files/ci/nitropc/ubuntu-oem/>`_, `Qubes OS <https://www.nitrokey.com/files/ci/nitropc/qubes-oem/>`_, `Debian <https://www.nitrokey.com/files/ci/nitropc/debian-oem/>`_, `Linux Mint <https://linuxmint.com/download.php>`_ Durante a inicialização do sistema o erro "Failed to start Load Kernel Modules" é exibido. `Esta é uma questão conhecida <https://github.com/QubesOS/qubes-issues/issues/2638>`_ que não é crítica e pode ser ignorada. Durante o arranque, o sistema irá pedir-lhe para introduzir a frase-chave para decifrar o disco rígido. Insira a frase-chave padrão "PleaseChangeMe". Durante o arranque, o sistema irá pedir-lhe para introduzir a frase-chave para decifrar o disco rígido. Insira a frase-chave padrão "PleaseChangeMe". O sistema irá então guiá-lo através do processo de criação de uma conta de utilizador. Depois disso, você deve ter inicializado o sistema com sucesso e já pode usá-lo normalmente. Introduza o PIN de utilizador da Nitrokey sempre que for solicitado (predefinição: 123456). Falha ao iniciar Carregar Módulos do Kernel Primeiro verifica o: Primeiro confirme a mensagem de erro mostrada acima. Depois vemos uma lista de todas as entradas possíveis de barcos - escolha a primeira pressionando simplesmente Enter. Como Começar Os cabeçalhos esperam um layout de teclado inglês, no qual, por exemplo, "y" e "z" são trocados em comparação com o layout de teclado alemão. Se você concordar com a seleção padrão (que é escrita em letra maiúscula), você também pode simplesmente confirmar pressionando Enter. Se o saco ou os parafusos não corresponderem às fotos enviadas, não se pode excluir uma abertura não autorizada do seu NitroPC. Neste caso, por favor contacte-nos para agendar outras acções. Se encomendou o seu NitroPC com parafusos selados e num saco selado, permite verificar se o NitroPC foi adulterado durante o transporte. Se você pressionar Enter depois, você receberá uma mensagem de erro que se parece com esta ou similar: Se você reiniciar o NitroPad após uma atualização, a tela de inicialização deve aparecer inicialmente como de costume, sem uma mensagem de erro. Linux: ``dd```, `balenaEtcher <https://www.balena.io/etcher/>`_; A seguir, ou aparece outra mensagem de erro ou o sistema operacional é iniciado. Isto depende da atualização do sistema. Se a seguinte mensagem de erro for exibida, proceda conforme descrito abaixo: NitroPC NitroPC FAQ NitroPC com Debian NitroPC com SO Qubes NitroPC com Ubuntu Agora insira a Nitrokey se este ainda não for o caso e confirme com Enter. Depois deve introduzir o PIN de utilizador da Nitrokey (por defeito: 123456). Não verá os caracteres que digitou no ecrã. Agora o NitroPad marca os arquivos alterados pela atualização, conforme verificado. Agora a Nitrokey tem de estar ligada, se ainda não for este o caso. Reinstalação do sistema operacional Opcional: Download hash sum e `verify <https://proprivacy.com/guides/how-why-and-when-you-should-hash-check#how-to-hash-check>`_ a imagem do sistema operacional baixada. Procedimento após uma atualização do sistema Atualização do sistema O NitroPad observa alterações em arquivos importantes do sistema para detectar adulterações de terceiros. Isto significa que às vezes são necessários passos especiais ao atualizar o sistema. Isto pode muitas vezes ser reconhecido pelo fato de que o sistema solicita que você reinicie o sistema. O saco e todos os parafusos do dispositivo foram selados. Para a bolsa e cada um destes parafusos você recebeu uma foto por e-mail. A senha padrão de criptografia de disco NitroPC: "PleaseChangeMe" O sistema já tem uma configuração de conta de usuário. Escolha-a e faça o login com a senha padrão "PleaseChangeMe". Você pode continuar usando a conta de usuário existente ou criar uma nova, como você quiser. Este exemplo mostra um parafuso selado cujo brilho representa um padrão individual. Para evitar a sobreposição acidencial de dados valiosos, formate depois a unidade USB. Para salvar este valor como padrão, selecione a opção "Make Ubuntu the default" para Ubuntu ou "Make Qubes the default" para o SO Qubes na janela seguinte. Usando WIFI (com chipset RTL8821ce) Verificar o Hardware Selado Janelas: `Rufus <https://rufus.ie/>`_, `balenaEtcher <https://www.balena.io/etcher/>`_; Escreva a imagem do sistema operacional em qualquer drive USB. Possíveis aplicações: O seu sistema irá então arrancar. `Assine a partição de arranque. <system-update.html>`_ MacOS: ``dd```, `balenaEtcher <https://www.balena.io/etcher/>`_. ou escolha o seu sistema operacional: 