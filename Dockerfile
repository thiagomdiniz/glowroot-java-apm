FROM docker.io/centos

MAINTAINER thiagomdiniz

RUN yum update -y
RUN yum install java wget unzip -y
RUN wget -q https://github.com/glowroot/glowroot/releases/download/v0.10.3/glowroot-central-0.10.3-dist.zip -O /opt/glowroot-central-0.10.3-dist.zip
RUN unzip /opt/glowroot-central-0.10.3-dist.zip -d /opt/

COPY config /opt/glowroot-central/glowroot-central.properties
COPY ui-cert.pem /opt/glowroot-central/ui-cert.pem
COPY ui-key.pem /opt/glowroot-central/ui-key.pem
COPY run.sh /opt/glowroot-central/run.sh

CMD ["/opt/glowroot-central/run.sh"]
