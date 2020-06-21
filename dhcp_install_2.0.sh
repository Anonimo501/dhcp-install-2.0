#!/bin/bash

echo "													   "
echo "	 												   "
echo "	 ▓█████▄  ██░ ██  ▄████▄   ██▓███      ██▓ ███▄    █   ██████ ▄▄▄█████▓ ▄▄▄       ██▓     ██▓      "
echo "	 ▒██▀ ██▌▓██░ ██▒▒██▀ ▀█  ▓██░  ██▒   ▓██▒ ██ ▀█   █ ▒██    ▒ ▓  ██▒ ▓▒▒████▄    ▓██▒    ▓██▒      "
echo "	 ░██   █▌▒██▀▀██░▒▓█    ▄ ▓██░ ██▓▒   ▒██▒▓██  ▀█ ██▒░ ▓██▄   ▒ ▓██░ ▒░▒██  ▀█▄  ▒██░    ▒██░      "
echo "	 ░▓█▄   ▌░▓█ ░██ ▒▓▓▄ ▄██▒▒██▄█▓▒ ▒   ░██░▓██▒  ▐▌██▒  ▒   ██▒░ ▓██▓ ░ ░██▄▄▄▄██ ▒██░    ▒██░      "
echo "	 ░▒████▓ ░▓█▒░██▓▒ ▓███▀ ░▒██▒ ░  ░   ░██░▒██░   ▓██░▒██████▒▒  ▒██▒ ░  ▓█   ▓██▒░██████▒░██████▒  "
echo "	  ▒▒▓  ▒  ▒ ░░▒░▒░ ░▒ ▒  ░▒▓▒░ ░  ░   ░▓  ░ ▒░   ▒ ▒ ▒ ▒▓▒ ▒ ░  ▒ ░░    ▒▒   ▓▒█░░ ▒░▓  ░░ ▒░▓  ░  "
echo "	  ░ ▒  ▒  ▒ ░▒░ ░  ░  ▒   ░▒ ░         ▒ ░░ ░░   ░ ▒░░ ░▒  ░ ░    ░      ▒   ▒▒ ░░ ░ ▒  ░░ ░ ▒  ░  "
echo "	  ░ ░  ░  ░  ░░ ░░        ░░           ▒ ░   ░   ░ ░ ░  ░  ░    ░        ░   ▒     ░ ░     ░ ░     "
echo "	    ░     ░  ░  ░░ ░                   ░           ░       ░                 ░  ░    ░  ░    ░  ░  "
echo "	  ░              ░                                                                                 "
echo "													   "
echo "	 												   "
echo "					[Created By Anonimo501] 					   "
echo "				  [https://youtube.com/c/Anonimo501]					   "
echo "													   "
echo "				    Hola bienvenid@s a DHCP Install		                           "
echo "					      Version 2.0						   "
echo " 													   "
echo " "
echo " "
read -rsp $'Press enter to continue...\n'

echo "**************************************"
echo " iniciaremos la instalacion de DHCP "
echo "**************************************"
echo " "
read -rsp $'Press enter to continue...\n'
echo " "
#Se instalara dhcp
yum install dhcp -y
echo " "


#echo "***************************************************************************************************************"
#echo " Ingresa la interface que deseas al archivo dhcpd en la ruta /etc/sysconfig/dhcpd - Ejemplo: ens33 - eth0 etc. "
#echo "***************************************************************************************************************"
#echo " Ejemplo: ens33 - eth0 etc: "
#echo "****************************"
#read input
#read -rsp $'Press enter to continue...\n'
# /Comentario/ se añade DHCPDARGS=ens34 al final del archivo dhcpd
#echo "DHCPDARGS=$input" >> /etc/sysconfig/dhcpd



echo " "
echo "****************************************************************************************"
echo "* A continuacion se configurara el archivo dhcpd.conf en la ruta /etc/dhcp/dhcpd.conf  *"
echo "* El script te pedira que ingreses las ip que deseas configurar del archivo dhcpd.conf *"
echo "****************************************************************************************"
echo " "
echo "********************************************************"
echo "* Ingresa la ip de Red que deseas Ejemplo: 192.168.0.0 *"
echo "********************************************************"
read input1
echo " "
echo "******************************************************************"
echo "* Ingresa la mascara de subred que deseas Ejemplo: 255.255.255.0 *"
echo "******************************************************************"
read mask
echo " "
echo "***********************************************************************"
echo "* Ingresa la ip de Inicio del rango que deseas Ejemplo: 192.168.0.10  *"
echo "***********************************************************************"
read input2
echo " "
echo "*********************************************************************"
echo "* Ingresa la ip del Fin del rango que deseas Ejemplo: 192.168.0.20  *"
echo "*********************************************************************"
read input3
echo " "
echo "****************************************************************************"
echo "* Ingresa la ip que deseas para tu host (Servidor) Ejemplo: 192.168.0.254  *"
echo "****************************************************************************"
read input4
echo " "
echo "****************************************************"
echo "* Ingresa la ip de tu router Ejemplo: 192.168.0.1  *"
echo "****************************************************"
read input5
echo " "
echo "*******************************************************"
echo "* Ingresa la ip del broadcast Ejemplo: 192.168.0.255  *"
echo "*******************************************************"
read input6
echo " "
echo "*******************************************************************"
echo "* Excelente se ha configurado Correctamente el Archivo dhcpd.conf  "
echo "* Si deseas verificar el archivo dirigete a /etc/dhcp/dhcpd.conf   "
echo "*******************************************************************"
echo " "
read -rsp $'Press enter to continue...\n'

echo "
authoritative;

# A slightly different configuration for an internal subnet.
subnet $input1 netmask $mask {
  range $input2 $input3;
  option domain-name-servers $input4;
 #option domain-name "Anonimo501.net";
  option routers $input5;
  option broadcast-address $input6;
  default-lease-time 600;
  max-lease-time 14400;
}

# host soporte-pc podemos descomentarlo y añadir un pc cliente
# de forma estatica para ello necesitamos su IP y su MAC

#host soporte-PC {
#  hardware ethernet 08:00:27:34:F2:68;
#  fixed-address 192.168.1.5;
#} 

" >> /etc/dhcp/dhcpd.conf

echo " "
echo "************************************************************************************"
echo "* Es importante hacer el siguiente proceso para que la interface haga los cambios  *"
echo "* Ingrese la interface de Red que desea reiniciar Ejemplo: ens34 - eth0            *"
echo "************************************************************************************"
read interface
echo " "
ifdown $interface
ifup $interface
echo " "
echo " Se reinicio la interface Correctamente  "
echo " "
read -rsp $'Press enter to continue...\n'

echo " "
echo "****************************"
echo " habilitaremos el firewall  "
echo "****************************"
echo " "
read -rsp $'Press enter to continue...\n'
# Se habilita el firewall para el servidio dhcp
firewall-cmd  --permanent --add-service=dhcp
firewall-cmd --reload

echo " "
echo "**********************************************************************************"
echo " Ahora iniciaremos el servicio DHCP y de dejara para que arranque con el sistema  "
echo "**********************************************************************************"
echo " "
read -rsp $'Press enter to continue...\n'
# Iniciamos el servicio dhcp y luego lo dejamos habilitado
# para que inicie al inicio de la maquina
systemctl start dhcpd
systemctl enable dhcpd

echo " "
echo "*********************************************************************"
echo " MUY BIEN! ya tienes instalado DHCP en tu Maquina hasta la proxima.  "
echo "*********************************************************************"
echo " "
read -rsp $'Press enter to Finish...\n'
