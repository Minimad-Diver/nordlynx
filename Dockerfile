FROM ubuntu:20.04

RUN mkdir /vpn
WORKDIR /vpn

COPY ./start.sh ./
RUN chmod +x ./start.sh

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && \
    apt install -y \
    curl

RUN curl https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb \
    --output nordvpn-release_1.0.0_all.deb && \
    apt install -y ./nordvpn-release_1.0.0_all.deb && \
    apt update && \
    apt install -y nordvpn || true

ENTRYPOINT [ "./start.sh" ]
