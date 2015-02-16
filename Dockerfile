FROM ubuntu:trusty
MAINTAINER Will Fong <will@digitaldev.com>

RUN apt-get -y update \
    && apt-get -y install curl unzip sysstat \
    && curl -SL -o /resmon.zip https://github.com/omniti-labs/resmon/archive/master.zip \
    && unzip /resmon.zip -d /opt \
    && rm -f /resmon.zip \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get purge -y --auto-remove curl unzip 

EXPOSE 81

COPY resmon.conf /opt/resmon-master/resmon.conf

CMD ["/opt/resmon-master/resmon", "-d"]

