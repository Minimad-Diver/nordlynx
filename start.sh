#!/bin/bash
echo "**** start script ****"
service nordvpn start

nordvpn login -u $USERNAME -p "$PASSWORD"
echo "**** set technology nordlynx ****"
nordvpn set technology nordlynx
echo "**** connect ****"
nordvpn connect

tail -f /dev/null
