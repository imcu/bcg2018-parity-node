FROM parity/parity:stable-release

RUN apt-get update && apt-get install -y openssh-server nano ntp
RUN rm -rf /etc/localtime && ln -s /usr/share/zoneinfo/Europe/London /etc/localtime
RUN /etc/init.d/ssh restart
RUN /etc/init.d/ntp restart

RUN echo "1"
RUN mkdir -p /parity && mkdir -p /root/.ssh
COPY authorized_keys /root/.ssh/authorized_keys
WORKDIR /parity/
COPY start.sh /parity/start.sh

ENTRYPOINT /parity/start.sh
