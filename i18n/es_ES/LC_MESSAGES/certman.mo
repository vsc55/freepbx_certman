��    Q      �  m   ,      �  #   �  �        �  (   �  1   �     �     	          0  #   F  "   j     �     �     �     �     �     �  -   	  *   ?	  ?   j	     �	     �	     �	  
   �	     �	     �	     
     
     +
     7
  #   =
     a
  #   m
     �
     �
     �
     �
  !   �
       	        &  �   =     �     �  "   �     
          #  
   5  �  @     �     �  #   �  *        ;     A  F   Q     �  .   �  $   �  .   �  #   "  /   F  <   v     �  +   �  J   �  3   @  [   t     �     �  	   �            �  $  �   �  x  �     "     &  -   .  �  \       �   :     �  *   �  -   �          9     E     [  +   s  %   �     �  !   �     �          &     A  )   W  (   �  E   �     �  "   �           5     I     X     _     r     �     �  8   �     �  ,   �               .  &   B  %   i     �     �     �  �   �     z     �  #   �     �     �     �     �  �  �     �     �  1     /   >  	   n     x  Q   �     �  5   �  0      A   P   .   �   2   �   C   �      8!  2   V!  M   �!  9   �!  W   "     i"     �"     �"     �"     �"  /  �"  %  �$  �  &     �'     �'  7   �'         ,              5   )   9                           :   $   8       M                F          1   G   4           D                 7         <   O   K   ?   .           6      %   /          L       #                 (   +   J   >      
   -           ;   	          C              *      3   Q   @      "      N          H      I              B       A   '   0          P   =      2   &   E   !    %s Already Exists at that location! A Certificate Authority is already present on this system. Deleting/Generating/Uploading will invalidate all of your current certificates! Action Are you sure you dont want a passphrase? Are you sure you want to delete this certificate? Can not be left blank! Certificate Certificate Already Exists Certificate Authority Certificate Authority Settings (CA) Certificate Authority to Reference Certificate File Certificate ID is unknown! Certificate List Certificate Management Certificate Settings Certificate already exists Certificate does not appear to be a .crt file Certificate doesnt appear to be a crt file Certificate to use for this CA (must reference the Private Key) Certificates DNS name or our IP address DTLS Rekey Interval DTLS Setup DTLS Verify Delete Delete Certificate Deleted Certificate Description Done! Edit Certificate Authority Settings Enable DTLS Enable or disable DTLS-SRTP support Error Uploading  Error uploading  Generate Certificate Generating default CA... Generating default certificate... Generating.. Please wait Host Name I Know what I am doing Interval at which to renegotiate the TLS session and rekey the SRTP session. If this is not set or the value provided is 0 rekeying will be disabled Name New Certificate New Certificate Authority Settings No No Certificates exist Organization Name Passphrase Passphrase used to access this certificate and generate new client certificates.
					If you don't use a passphrase when generating a new certifcate, then the private key is not encrypted with any symmetric cipher - it is output completely unprotected.
					If you don't provide a passphrase when uploading a certificate you will have to provide the passphrase everytime a new certificate is needed Private Key Private Key File Private Key File to use for this CA Private key doesnt appear to be a key file Reset Save Passphrase Select this for additional fields used to upload your own certificate. Submit Successfully deleted the Certificate Authority Successfully generated a Certificate Successfully generated a Certificate Authority Successfully uploaded a certificate The Certificate to use from Certificate Manager The Description of this certificate. Used in the module only The Organization Name The Passphrase of the Certificate Authority The base name of the certificate, Can only contain alphanumeric characters This field cannot be blank and must be alphanumeric This module is intended to manage and generate certificates used for extensions in asterisk Update Certificate Updated Certificate Upload CA Upload Certificate Use Certificate Verify that provided peer certificate and fingerprint are valid
		<ul>
			<li>A value of 'yes' will perform both certificate and fingerprint verification</li>
			<li>A value of 'no' will perform no certificate or fingerprint verification</li>
			<li>A value of 'fingerprint' will perform ONLY fingerprint verification</li>
			<li>A value of 'certificate' will perform ONLY certficiate verification</li>
			</ul> Whether to store the password in the database so that new certificates can be generated automatically.<br/>
					<b>WARNING!!</b> The Passphrase is stored in PLAINTEXT! You have been warned. Use Something you dont care about or use! Whether we are willing to accept connections, connect to the other party, or both.
		This value will be used in the outgoing SDP when offering and for incoming SDP offers when the remote party sends actpass
		<ul>
			<li>active (we want to connect to the other party)</li>
			<li>passive (we want to accept connections only)</li>
			<li>actpass (we will do both)</li>
			</ul> Yes default default certificate generated at install time Project-Id-Version: PACKAGE VERSION
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2015-10-29 17:45-0700
PO-Revision-Date: 2016-01-14 22:56+0200
Last-Translator: Ernesto <ecasas@sangoma.com>
Language-Team: Spanish <http://weblate.freepbx.org/projects/freepbx/certman/es_ES/>
Language: es_ES
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=2; plural=n != 1;
X-Generator: Weblate 2.2-dev
 %s Ya existe en esa localidad! Una Autoridad de Certificación ya esta presente en el sistema. Borrar/generar/Bajar invalidara todos sus actuales certificados! Acción ¿Seguro que no quieres una frase de paso? ¿Seguro que quieres borrar este certificado? No se puede dejar en blanco! Certificado Certificado ya existe Autoridad Certificadora Configuración Autoridad Certificadora (CA) Autoridad Certificadora a Referenciar Archivo Certificado ID de Certificado es desconocido! Lista de certificados Gestión Certificado Configuración Certificado Ya existe Certificado Certificado no parece ser un archivo .crt Certificado no parece ser un archivo crt Certificado a usar para esta CA (debe referenciar a la Clave Privada) Certificados Nombre DNS o nuestra dirección IP Intervalo Rekey DTLS Configuración DTLS Verificar DTLS Borrar Borrar Certificado Borrar Certificado Descripción Hecho! Editar la configuración de la autoridad del certificado Habilitar DTLS Habilitar o deshabilitar soporte a DTLS-SRTP Error subiendo  Error al subir  Generar Certificado Generando Certificado CA por defecto.. Generando Certificados por defecto... Generación .. Por favor espere Nombre del Host Sé lo que estoy haciendo Intervalo en el que se renegociara  de la sesión TLS y recodificara la sesión SRTP. Si no se establece, o el valor proporcionado es 0 rekeying se desactivará Nombre Nuevo Certificado Ajustes Autoridad nuevo certificado No No existe Certificado Nombre de Organización Palabra Clave Frase de contraseña utilizada para acceder a este certificado y generar nuevos certificates de cliente.↵
→→→→→ Si usted no usa una frase de acceso al generar un nuevo certifcado, entonces la clave privada no será cifrada con cualquier sistema de cifrado simétrico - que se emite por completo desprotegido.↵
→→→→→ Si usted no proporciona una contraseña al cargar un certificado que tendrá que proporcionar la contraseña cada vez que se necesita un nuevo certificado Clave Privada Archivo de Clave Privada Archivo de Clave Privada a ser usado para esta CA Llave Privada no parece ser un archivo de llave Reiniciar Salvar la palabra clave Selecciones este para campos adicionales usados para bajar su propio certificado. Enviar Autoridad de Certificacion satisfactoriamente borrada Se ha generado satisfactoriamente un Certificado Se ha generador satisfactoriamente una Autoridad de Certificacion Se ha bajado satisfactoriamente un Certificado Certificado a usar desde el Gestor de Certificados La Descripción de este certificado. Usado en el modulo únicamente El Nombre de la Organización La Palabra Clave de la Autoridad de Certificación EL nombre base del certificado. Solo puede contener caracteres alfanuméricos El campo no puede estar en blanco y debe ser alfanumerico Este modulo pretende manejar y generar certificados usados para extensiones en Asterisk Actualizar Certificado Certificado Actualizado Subir CA Subir Certificado Use Certificado Verifique que el certificado pareja proporcionado y la huella digital sean validos↵
→→ <ul> ↵
→→→ <li> Un valor de "sí" llevará a cabo verificación tanto en el certificado como en  la huella digital</li>↵
→→→ <li> Un valor de "no" llevará a cabo ninguna verificación de certificado o de huellas digitales</li>↵
 →→→ <li> Un valor de 'fingerprint' realizará SOLAMENTE verificación de huellas digitales</li>↵
 →→→ <li> Un valor de 'certificate' realizará SOLAMENTE verificación certificado</li>↵
 →→→ </ul> Ya sea para almacenar la contraseña en la base de datos para que los nuevos certificados se pueden generar de forma automática.<br/>↵
→→→→→ <b>ADVERTENCIA !! </b> La frase de contraseña es almacenada en texto plano! Usted ha sido advertido. Utilice Algo que no le importe o use! Si estamos dispuestos a aceptar conexiones, conectarse a la otra parte, o ambas.↵
→→ Este valor se utilizará en el SDP saliente al ofrecer y para entrante SDP ofrece cuando la parte remota envía actpass↵
→→ <ul>↵
→→→ <li> activa (queremos conectar a la otra parte) </li> ↵
→→→ <li> pasiva (queremos aceptar sólo conexiones) </li> ↵
→→→ <li> actpass (vamos a hacer las dos cosas) </li> ↵
→→→ </ul> Si Por defecto certificado por defecto generado al momento de instalar 