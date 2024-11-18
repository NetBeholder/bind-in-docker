$TTL    1d ;                  default expiration time (in seconds) of all RRs without their own TTL value
$ORIGIN dev.lol-kek.lol. ;        base domain-name
@       IN      SOA     ns1.dev.lol-kek.lol. hostmaster.dev.lol-kek.lol. (
                  4      ; Serial
                  1d     ; Refresh
                  1h     ; Retry
                  1w     ; Expire
                  1h )   ; Negative Cache TTL



; name servers - NS records
     IN      NS      ns1.dev.lol-kek.lol.

; name servers - A records
ns1.dev.lol-kek.lol.		IN      A      172.30.0.2
@                      		IN      A      172.30.0.2

srv1.dev.lol-kek.lol.		IN      A      172.30.0.3
srv2.dev.lol-kek.lol.		IN      A      172.30.0.3
srv3.dev.lol-kek.lol.		IN      A      172.30.0.3
srv4.dev.lol-kek.lol.		IN      A      172.30.0.3