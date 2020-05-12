FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive

RUN mkdir /vpn
WORKDIR /vpn

COPY ./start.sh ./
RUN chmod +x ./start.sh

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ADD https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb ./

RUN apt-get update && \
    apt-get install -y dialog apt-utils && \
    apt-get install -y ca-certificates && \
    apt-get install -y ./nordvpn-release_1.0.0_all.deb && \
    apt-get update && \
    apt-get install -y nordvpn

ENTRYPOINT [ "./start.sh" ]
