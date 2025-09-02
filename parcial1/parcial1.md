## PARCIAL 1

### PARTE 1
1. Instalación de bind9

sudo apt install bind9

/etc/bind/named.conf.local -> en donde se almacenan las zonas de las que el servidor maestro es autoritativo. Aquí también se configuran el tipo de zona (master - primary, secondary), el archivo de zona

Aquí tambien sen configuran las zonas que serán distribuidas a servidores secuendarios.

db.[NOMBRE_ZONA].[com] Es el archivo de zona en el que se establece los RR (Resource Records) y la configuración de la zona, las directivas como $TTL
IN -> Record Class
Parámetros del SOA -> Refresh ( Cada cuantos milisegundos los DNS Secundarios verifican los cambios) 

parcial1/parte1/slave-dns-named.conf.local -> es donde está alogada la configuración del archivo de configuración de bind9 para definir las zonas que son transferidas (Transferencia de zonas) con el tipo de solicitud AXFR 

Para apagar el servicio de bind9 se utiliza: sudo systemctl stop bind9


PARTE 2
Instalación
sudo apt install apache2
Configuración
- Habilitar mod_deflate: crear un archivo en /etc/apache2/conf-available/comprenssion.conf 

# Verificar configuración principal
sudo named-checkconf

# Verificar zona directa
sudo named-checkzone empresa.local /etc/bind/zones/db.empresa.local

# Verificar zona inversa
sudo named-checkzone 1.168.192.in-addr.arpa /etc/bind/zones/db.192.168.1

# Resultado esperado:
# zone empresa.local/IN: loaded serial 2024090201
# OK

# Recargar configuración sin reiniciar
sudo rndc reload

# Información de zona
sudo rndc zonestatus empresa.local

# Habilitar el módulo de compresión
sudo a2enmod deflate

# Activar la configuración
sudo a2enconf compression

También se podía utilizar el archivo /etc/apache2/mods-available/deflate.conf

<IfModule mod_deflate.c>
	<IfModule mod_filter.c>
		AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript
		AddOutputFilterByType DEFLATE application/x-javascript application/javascript application/ecmascript
		AddOutputFilterByType DEFLATE application/rss+xml
		AddOutputFilterByType DEFLATE application/wasm
		AddOutputFilterByType DEFLATE application/xml
	</IfModule>
</IfModule>

# vim: syntax=apache ts=4 sw=4 sts=4 sr noet

# Reiniciar Apache
sudo systemctl restart apache2

# Verificar que está funcionando
curl -H "Accept-Encoding: gzip" -I http://tu-sitio.com


# Deshabilidad mod_deflate
a2dismod deflate -f

PARTE 3

se mueve el archivo ngrok a /usr/local/bin

# Dar permisos de ejecución
sudo chmod +x /usr/local/bin/ngrok
