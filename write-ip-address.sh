#!/bin/bash
CURRENT_DIR=$(dirname "$0")

main () {
  /sbin/ifconfig en0 2>/dev/null | grep netmask | sed -E 's/.*inet (.*) netmask.*/\1/' > $CURRENT_DIR/ip-address-en0
  /sbin/ifconfig bridge100 2>/dev/null | grep netmask | sed -E 's/.*inet (.*) netmask.*/\1/' > $CURRENT_DIR/ip-address-bridge100
  /Sy*/L*/Priv*/Apple8*/V*/C*/R*/airport -I | grep ' SSID' | sed 's/.*: //' > $CURRENT_DIR/wifi-network
}

# run every second for a minute to overcome cron's one minute granularity
for i in `seq 1 11`; do
  main
  sleep 5
done
