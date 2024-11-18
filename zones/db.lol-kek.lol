$TTL    1d ;                  default expiration time (in seconds) of all RRs without their own TTL value
$ORIGIN lol-kek.lol. ;        base domain-name
@       IN      SOA     ns1.lol-kek.lol. hostmaster.lol-kek.lol. (
                  4      ; Serial
                  1d     ; Refresh
                  1h     ; Retry
                  1w     ; Expire
                  1h )   ; Negative Cache TTL



; name servers - NS records
     IN      NS      ns1.lol-kek.lol.

; name servers - A records
ns1.lol-kek.lol.		IN      A      172.30.0.2
@              		IN      A      172.30.0.2

;service1.instar-net.io.       	IN      A      172.24.0.3
;service2.instar-net.io.       	IN      A      172.24.0.4

srv1.lol-kek.lol.		IN      A      172.30.0.3
srv2.lol-kek.lol.		IN      A      172.30.0.3
srv3.lol-kek.lol.		IN      A      172.30.0.3