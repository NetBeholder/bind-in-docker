#!/usr/bin/dumb-init /bin/bash

function log() {
   # timestamp    Severity: $1   Message: $2
   printf "%(%d-%b-%Y %H:%M:%S.000)T\tSeverity: %s \t\tMessage: %s\n" -1 "$1" "$2"

}

function check_zone ()
{
   local zone_name="$1"
   local zone_file="$2"

   while read j
   do
      log "warn" "$zone_file has been changed"
      rndc reload $zone_name
      #break
   done < <(inotifywait -m -q -e CLOSE_WRITE $zone_file)
}

# check if rndc.key file exists
if ! test -f /etc/bind/rndc.key; then
   log "warn" "rndc.key file does not exist. Creating it..."
   rndc-confgen -a -A hmac-sha256 -b 256 -u $BIND_USER
fi

log "info" "Starting BIND container..."
/usr/sbin/named -u $BIND_USER -f -c /etc/bind/named.conf -L /var/log/bind/default.log &

# put to dictionary k/v pairs as "zone name" = "full zone's file path"
declare -A arr
arr["lol-kek.lol"]="/etc/bind/zones/db.lol-kek.lol"
arr["dev.lol-kek.lol"]="/etc/bind/zones/db.dev.lol-kek.lol"

# start monitoring zone files in a loop...
for key in "${!arr[@]}";
   do
      check_zone "$key" "${arr[$key]}" &
   done
wait