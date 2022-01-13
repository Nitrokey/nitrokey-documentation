��    A      $              ,     -     H  "   g  T   �  �   �     o  !   �  v   �  �   '  z   �  �   2     �  a     &   p  �  �  �   X
      1  Q   R     �     �     �  �   �  K   �  L   �  �   %  �   �  �   �  �   �  �        �  Q   �  �   7     �     �     �  7     [   G     �  P   �  �   �  /   �  /   �     �  V     C   b     �  �  �  �  O  �   �  �   �  �   �  �  Y  �   0  Q   �  �   .               ;  u  R  f   �     /      3      <      E   �  N      -"     H"  *   g"  _   �"  �   �"  0   �#  +   �#  u   �#  �   X$  |   �$  �   m%  "   7&  e   Z&  $   �&  �  �&  �   �(     �)  M   �)     �)     	*     *  �   3*  U   �*  V   E+  �   �+  �   e,  �   *-  �   
.  �   �.     b/  o   t/  �   �/     ~0     �0     �0  C   �0  W   
1     b1  _   k1  �   �1  2   f2  1   �2     �2  J   �2  ~   53     �3  �  �3  �  �5  �   �7  �   Y8  �   U9  �   :  �   �;  T   �<  �   =     �=      �=     >  �  2>  l   �?     /@  	   3@  	   =@     G@   (Nitrokey T430 - Qubes OS) (Nitrokey T430 - Ubuntu Linux) Add “Network controler” device After purchase, the passwords are set to a default value and must be changed by you: After that, please follow `these instructions from step 3 onwards `system update <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. Behavior After a System Update Change Disk Encryption Passphrase Change the PINs of your Nitrokey as `described here <https://docs.nitrokey.com/pro/change-user-and-admin-pin.html>`__. Change the passphrase for disk encryption as `described here <https://docs.nitrokey.com/x230/ubuntu/change-disk-encryption-passphrase.html>`__. Change the passphrase for the hard disk encryption by running “sudo cryptsetup luksChangeKey /dev/sda2” in a terminal. Check each screw individually to see if its individual appearance matches the photo. It is best to use a magnifying glass or macro lens for this purpose. The screws are numbered as follows. Choose your operating system: Click on the Nitrokey icon on the left side of the screen to open the pre-installed Nitrokey App. Click “OK” and restart the system. Each boot the code is generated on the Nitropad and the Nitrokey, if its connected. It is allowed to run 10 boots without loosing the synchronization between the devices, after which the bad code signal is shown, regardless of the rest of the system being in a correct state. If you are sure the system was not beign tampered with (e.g. the Nitropad was booted more than 10 times without the Nitrokey), you can safely reset the system’s warning. Each time you start the NitroPad, you should - if possible - connect your Nitrokey. If the Nitrokey is plugged in and the system has not been modified, the following screen will appear when the NitroPad is turned on. Enter the your account password. Enter “PleaseChangeMe” as the current passphrase and select a secure new one. Generate new TOTP/HOTP secret Getting Started Go to Devices tab How the boot process may look like if the system has been changed (for example after an update) and what error messages may otherwise occur is described further below. If Qubes doesn’t boot as shown below, please execute the following steps: If Ubuntu doesn’t boot as shown below, please execute the following steps: If the bag or the screws do not match the photos sent, an unauthorized opening of your NitroPad cannot be excluded. In this case please contact us to arrange further action. If the information on the NitroPad does not match the information on the Nitrokey, the background would turn red and the message “Invalid Code” would appear. This could indicate that manipulation has taken place. If you have ordered the unit with the option “sealed screws and sealed bag”, please `verify the sealing <verify-sealed-hardware.html>`__ before unpacking. If you do not know what this means, skip this section. If you ordered your NitroPad with sealed screws and in a sealed bag, it allows you to check if the NitroPad has been tampered with during shipping. In case the Network Manager icon is not shown and when starting a VM an error like “Domain sys-net has failed to start: PCI device dom0:03_00.0 does not exist” is shown, proceed as follows: Invalid Code Left click on the gears and select “Change Passphrase” from the context menu. Next, the system will prompt you to enter the passphrase to decrypt the hard disk. The passphrase is initially “PleaseChangeMe”. |image3| NitroPad T430 NitroPad X230 with Qubes OS NitroPad X230 with Ubuntu Linux Open menu -> Service: sys-net -> sys-net: Qube Settings Open the pre-installed Nitrokey App and change the PINs of your Nitrokey as described here. Options Please connect the Nitrokey and execute the following from the main boot screen: Press Enter (“Default Boot”) after booting the system, provided the NitroPad has not shown any errors and the Nitrokey is lit green (see above). Remove “Unknown device” from the right side Restart your Laptop and go to Options. |image5| Secure Starting Procedure Select the field that says “Luks”. Afterwards it should have an orange background. Select “Update Checksums and sign all files on /boot”. |image6| TPM/TOTP/HOTP Options That’s why it’s important to restart your NitroPad under controlled conditions after a system update. Only when the new status has been confirmed can you leave the device unattended again. Otherwise, you will not be able to distinguish a possible attack from a system update. Detailed instructions for a system update can be `found here <https://docs.nitrokey.com/x230/qubes/system-update.html>`__. That’s why it’s important to restart your NitroPad under controlled conditions after a system update. Only when the new status has been confirmed can you leave the device unattended again. Otherwise, you will not be able to distinguish a possible attack from a system update. Detailed instructions for a system update can be `found here <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. The NitroPad X230 can also be started without the Nitrokey. If you don’t have the Nitrokey with you, but are sure that the hardware has not been manipulated, you can boot your system without checking. The NitroPad firmware checks certain system files for changes. If your operating system has updated important components, you will be warned the next time you boot the NitroPad. This could look like this, for example: The bag and all screws on the bottom of the device have been sealed. For the bag and each of these screws you have received a photo by e-mail. The orientation of the photos is such that the battery is on top. The box marked in red contains the information that the BIOS has not been changed and that the shared secret of the NitroPad and the Nitrokey match. But this information is not sufficient, because an attacker could have faked it. If at the same time the Nitrokey also flashes green, everything is fine. An attacker would have to have had access to the NitroPad and Nitrokey to achieve this result. It is therefore important that you do not leave both devices unattended. The system will then guide you through the process of creating a user account. After that you should have successfully booted the system and could already use it normally. This example shows a sealed screw whose glitter represents an individual pattern. To change the passphrase for disk encryption, first click on “Activities” in the upper left corner and enter “disk” in the search bar. Then select the “Disks” program that appears in the middle of the screen. Troubleshooting Verification of Sealed Hardware Verify Sealed Hardware With the NitroPad X230, malicious changes to the BIOS, operating system, and software can be easily detected. For example, if you left your NitroPad in a hotel room, you can use your Nitrokey to check if it has been tampered with while you were away. If an attacker modifies the NitroPad’s firmware or operating system, the Nitrokey will detect this (instructions below). and follow the on-screen guide. After that the secret and counter should be both reset to a new value. img |image1| |image2| |image4| Project-Id-Version: Nitrokey Documentation
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2021-03-18 14:53+0100
PO-Revision-Date: 2022-01-11 15:10+0000
Last-Translator: Anonymous <noreply@weblate.org>
Language: pt
Language-Team: Portuguese <https://translate.nitrokey.com/projects/nitrokey-documentation/documentation-t430/pt/>
Plural-Forms: nplurals=2; plural=n > 1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 (Nitrokey T430 - Qubes OS) (Nitrokey T430 - Ubuntu Linux) Adicionar dispositivo "Controlador de rede Após a compra, as senhas são definidas para um valor padrão e devem ser alteradas por você: Depois disso, por favor siga `estas instruções a partir do passo 3 `system update <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. Comportamento após uma atualização do sistema Mudar frase-chave de encriptação de disco Altere os PINs da sua Nitrokey como `descrito aqui <https://docs.nitrokey.com/pro/change-user-and-admin-pin.html>`__. Altere a frase-senha para encriptação de disco como `descrito aqui <https://docs.nitrokey.com/x230/ubuntu/change-disk-encryption-passphrase.html>`__. Mude a frase-chave para a criptografia do disco rígido executando "sudo cryptsetup luksChangeKey /dev/sda2" em um terminal. Verifique cada parafuso individualmente para ver se a sua aparência individual corresponde à foto. É melhor usar uma lupa ou lente macro para este fim. Os parafusos são numerados da seguinte forma. Escolha o seu sistema operacional: Clique no ícone Nitrokey no lado esquerdo do ecrã para abrir a aplicação Nitrokey pré-instalada. Clique em "OK" e reinicie o sistema. Cada boot o código é gerado no Nitropad e no Nitrokey, se estiver conectado. É permitido executar 10 boots sem perder a sincronização entre os dispositivos, após os quais é mostrado o mau sinal do código, independentemente do resto do sistema estar em um estado correto. Se tiver a certeza de que o sistema não foi alterado (por exemplo, o Nitropad foi inicializado mais de 10 vezes sem a Nitrokey), pode repor o aviso do sistema em segurança. Cada vez que iniciar o NitroPad, você deve - se possível - conectar sua Nitrokey. Se o Nitrokey estiver ligado e o sistema não tiver sido modificado, aparecerá a seguinte tela quando o NitroPad estiver ligado. Digite a senha da sua conta. Digite "PleaseChangeMe" como a senha atual e selecione uma nova senha segura. Gerar novo segredo TOTP/HOTP Como Começar Ir para a guia Dispositivos Como pode ser o processo de arranque se o sistema tiver sido alterado (por exemplo, após uma actualização) e que mensagens de erro podem de outra forma ocorrer é descrito mais abaixo. Se o Qubes não arrancar como mostrado abaixo, por favor execute os seguintes passos: Se o Ubuntu não arrancar como mostrado abaixo, por favor execute os seguintes passos: Se o saco ou os parafusos não corresponderem às fotos enviadas, não pode ser excluída uma abertura não autorizada do seu NitroPad. Neste caso, por favor contacte-nos para agendar outras acções. Se a informação no NitroPad não corresponder à informação no Nitrokey, o fundo ficaria vermelho e a mensagem "Código Inválido" apareceria. Isto poderia indicar que a manipulação ocorreu. Se você encomendou a unidade com a opção "parafusos selados e saco selado", por favor `verificar a selagem <verify-sealed-hardware.html>`__ antes de desembalar. Se você não sabe o que isto significa, pule esta seção. Se encomendou o seu NitroPad com parafusos selados e num saco selado, permite-lhe verificar se o NitroPad foi adulterado durante o transporte. No caso do ícone Network Manager não ser mostrado e ao iniciar uma VM, um erro como "Domain sys-net falhou em iniciar: PCI device dom0:03_00.0 does not exist" é mostrado, proceda da seguinte forma: Código Inválido Clique com o botão esquerdo do mouse sobre as engrenagens e selecione "Change Passphrase" no menu de contexto. Em seguida, o sistema solicitará que você digite a senha para descriptografar o disco rígido. A frase-senha é inicialmente "PleaseChangeMe". |image3| NitroPad T430 NitroPad X230 com SO Qubes NitroPad X230 com Ubuntu Linux Abrir menu -> Serviço: sys-net -> sys-net: Configurações do cubo Abra o Nitrokey App pré-instalado e altere os PINs do seu Nitrokey como descrito aqui. Opções Por favor, ligue a Nitrokey e execute o seguinte a partir da tela de inicialização principal: Prima Enter ("Default Boot") após arrancar o sistema, desde que o NitroPad não tenha mostrado nenhum erro e a Nitrokey esteja acesa a verde (ver acima). Remover "Dispositivo desconhecido" do lado direito Reinicie seu Laptop e vá para Opções. |image5| Procedimento de início seguro Selecione o campo que diz "Luks". Depois deve ter um fundo cor-de-laranja. Seleccione "Update Checksums and sign all files on /boot" (Actualizar Cheques e assinar todos os ficheiros em /boot). |image6| Opções TPM/TOTP/HOTP É por isso que é importante reiniciar seu NitroPad sob condições controladas após uma atualização do sistema. Somente quando o novo status tiver sido confirmado é que você poderá deixar o dispositivo sem supervisão novamente. Caso contrário, você não será capaz de distinguir um possível ataque de uma atualização do sistema. Instruções detalhadas para uma actualização do sistema podem ser `found aqui <https://docs.nitrokey.com/x230/qubes/system-update.html>`__. É por isso que é importante reiniciar seu NitroPad sob condições controladas após uma atualização do sistema. Somente quando o novo status tiver sido confirmado é que você poderá deixar o dispositivo sem supervisão novamente. Caso contrário, você não será capaz de distinguir um possível ataque de uma atualização do sistema. Instruções detalhadas para uma actualização do sistema podem ser `found aqui <https://docs.nitrokey.com/x230/ubuntu/system-update.html>`__. O NitroPad X230 também pode ser iniciado sem a Nitrokey. Se não tiver o Nitrokey consigo, mas tiver a certeza que o hardware não foi manipulado, pode arrancar o seu sistema sem verificar. O firmware NitroPad verifica certos arquivos de sistema para alterações. Se o seu sistema operacional tiver atualizado componentes importantes, você será avisado na próxima vez que iniciar o NitroPad. Isto pode ser parecido com isto, por exemplo: O saco e todos os parafusos no fundo do dispositivo foram selados. Para a bolsa e cada um destes parafusos você recebeu uma foto por e-mail. A orientação das fotos é tal que a bateria está em cima. A caixa marcada a vermelho contém a informação de que a BIOS não foi alterada e que o segredo partilhado do NitroPad e da Nitrokey coincide. Mas esta informação não é suficiente, porque um atacante poderia tê-la fingido. Se ao mesmo tempo a Nitrokey também piscar a verde, tudo está bem. Um atacante teria de ter tido acesso ao NitroPad e ao Nitrokey para conseguir este resultado. Por isso é importante que não deixe ambos os dispositivos desacompanhados. O sistema irá então guiá-lo através do processo de criação de uma conta de utilizador. Depois disso, você deve ter iniciado o sistema com sucesso e já pode usá-lo normalmente. Este exemplo mostra um parafuso selado cujo brilho representa um padrão individual. Para alterar a frase-chave para criptografia de disco, primeiro clique em "Atividades" no canto superior esquerdo e digite "disco" na barra de busca. Depois selecione o programa "Discos" que aparece no meio da tela. Resolução de problemas Verificação de Hardware Selado Verificar o Hardware Selado Com o NitroPad X230, alterações maliciosas na BIOS, sistema operacional e software podem ser facilmente detectadas. Por exemplo, se você deixou seu NitroPad em um quarto de hotel, você pode usar sua Nitrokey para verificar se ele foi adulterado enquanto você estava fora. Se um atacante modificar o firmware ou sistema operativo do NitroPad, a Nitrokey irá detectar isto (instruções abaixo). e siga o guia no ecrã. Depois disso, o segredo e o contador devem ser ambos redefinidos para um novo valor. img |imagem1| |imagem2| |image4| 