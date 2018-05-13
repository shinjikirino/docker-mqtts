FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y mosquitto openssl && \
    apt-get clean
RUN mkdir /tmp/ca /tmp/ca/server /tmp/ca/client
RUN chown -R mosquitto:mosquitto /var/log/mosquitto

COPY gen-cert.sh /usr/local/bin/gen-cert.sh
COPY conf/mosquitto-local.conf /etc/mosquitto/conf.d/
RUN cat /etc/mosquitto/conf.d/mosquitto-local.conf >> /etc/mosquitto/mosquitto.conf
EXPOSE 1883 
EXPOSE 8883 

CMD /usr/local/bin/gen-cert.sh && mosquitto
