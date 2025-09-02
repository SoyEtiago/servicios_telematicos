;
$TTL	604800
@	IN	SOA	etienne.com. etiennesamboni.gmail.com. (
			      2		; Serial
			 604800		; Refresh
			  86400		; Retry
			2419200		; Expire
			 604800 )	; Negative Cache TTL
;
@	IN	NS	ns.etienne.com.
@	IN	A	192.168.50.3

; Registros A
ns      IN      A       192.168.50.3
parcial IN      A       192.168.50.3
