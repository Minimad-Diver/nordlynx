# nordlynx
Docker image for NordLynx, WireGuard implementation by NordVPN

## Parameters
| Parameter | Function |
| :----: | --- |
| `-e TZ=Europe/London` | Specify a timezone to use Eg.: Europe/London. |
| `-e NL_USERNAME=` | Username. |
| `-e NL_PASSWORD=` | Password. |
| `-e NL_COUNTRY=` | (Optional) from `nordvpn countries` |
| `-e NL_GROUP=` | (Optional) from `nordvpn groups` |
| `-e NL_WHITELIST=` | (Optional) Adds subnet to a whitelist. Eg.: `192.168.1.1/24` |