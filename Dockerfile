FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ Europe/London

RUN mkdir /vpn
WORKDIR /vpn

COPY ./start.sh ./
RUN chmod +x ./start.sh

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb ./

RUN apt-get update && \
    apt-get install -y --no-install-recommends dialog apt-utils && \
    apt-get install -y --no-install-recommends ca-certificates wireguard-tools && \
    apt-get install -y ./nordvpn-release_1.0.0_all.deb && \
    apt-get update && \
    apt-get install -y --no-install-recommends nordvpn=3.7.4 && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "./start.sh" ]
