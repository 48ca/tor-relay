#!/bin/bash
set -e
set -o pipefail

file="/etc/tor/torrc.${RELAY_TYPE}"

if [ -z "${RELAY_NICKNAME}" ]       ||
   [ -z "${RELAY_BANDWIDTH_RATE}" ] ||
   [ -z "${RELAY_BANDWIDTH_BURST}" ] ||
   [ -z "${RELAY_TYPE}" ] ||
   [ -z "${RELAY_PORT}" ]
then
    echo -e "Specify all of the following environment variables:"
    echo -e "\tRELAY_NICKNAME"
    echo -e "\tRELAY_BANDWIDTH_RATE  (e.g. '2000 KBytes')"
    echo -e "\tRELAY_BANDWIDTH_BURST (e.g. '4000 KBytes')"
    echo -e "\tRELAY_TYPE            ('middle'/'exit'/'bridge')"
    echo -e "\tRELAY_PORT            (e.g. '9001')"
    echo -e "\t > note: make sure to have Docker forward RELAY_PORT"
    echo -e "\t         to 9001 inside the container."
    echo -e "\t    e.g. $ docker -p <RELAY_PORT>:9001 ..."
    exit 1
fi

sed -i "s/RELAY_NICKNAME/${RELAY_NICKNAME}/g" "$file"
sed -i "s/CONTACT_GPG_FINGERPRINT/${CONTACT_GPG_FINGERPRINT}/g" "$file"
sed -i "s/CONTACT_NAME/${CONTACT_NAME}/g" "$file"
sed -i "s/CONTACT_EMAIL/${CONTACT_EMAIL}/g" "$file"
sed -i "s/RELAY_BANDWIDTH_RATE/${RELAY_BANDWIDTH_RATE}/g" "$file"
sed -i "s/RELAY_BANDWIDTH_BURST/${RELAY_BANDWIDTH_BURST}/g" "$file"
sed -i "s/RELAY_PORT/${RELAY_PORT}/g" "$file"

echo "Starting ${RELAY_TYPE} relay"

exec tor -f "/etc/tor/torrc.${RELAY_TYPE}"
