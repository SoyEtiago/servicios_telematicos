## PARCIAL 1

### PARTE 1
1. Instalación de bind9

sudo apt install bind9

/etc/bind/named.conf.local -> en donde se almacenan las zonas de las que el servidor maestro es autoritativo. Aquí también se configuran el tipo de zona (master - primary, secondary), el archivo de zona

Aquí tambien sen configuran las zonas que serán distribuidas a servidores secuendarios.

db.[NOMBRE_ZONA].[com] Es el archivo de zona en el que se establece los RR (Resource Records) y la configuración de la zona, las directivas como $TTL
IN -> Record Class
Parámetros del SOA -> Refresh ( Cada cuantos milisegundos los DNS Secundarios verifican los cambios) 

 
