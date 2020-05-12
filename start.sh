#!/bin/bash
echo "**** start script ****"
echo "**** set timezone ****"
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && echo $TZ

echo "**** start service ****"
#service nordvpn start
bash /etc/init.d/nordvpn start
sleep 5

echo "**** login ****"
nordvpn login -u $USERNAME -p "$PASSWORD"
echo "**** set technology nordlynx ****"
nordvpn set technology nordlynx
echo "**** connect ****"
nordvpn connect

tail -f /dev/null
