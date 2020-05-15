#!/bin/bash
echo "**** start script ****"
echo "**** set timezone ****"
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && echo $TZ

echo "**** start service ****"
#service nordvpn start
bash /etc/init.d/nordvpn start
sleep 5

echo "**** login ****"
nordvpn login -u $NL_USERNAME -p "$NL_PASSWORD"
echo "**** set technology nordlynx ****"
nordvpn set technology nordlynx
echo "**** connect ****"

if [[ ! -v NL_GROUP ]] || [[ -z "$NL_GROUP" ]]; then
   nordvpn whitelist add subnet $NL_WHITELIST
fi

if [[ ! -v NL_GROUP ]] || [[ -z "$NL_GROUP" ]]; then
    echo "NL_GROUP is not set"
    nordvpn connect $NL_COUNTRY
else
    nordvpn connect $NL_COUNTRY -g $NL_GROUP
fi

tail -f /dev/null
