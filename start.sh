#!/bin/bash
echo "**** start script ****"
service nordvpn start
#systemctl start nordvpn

nordvpn login -u $USERNAME -p "$PASSWORD"
nordvpn set technology nordlynx
nordvpn connect

tail -f /dev/null
