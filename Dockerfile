FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y mosquitto openssl && \
    apt-get clean
RUN mkdir /tmp/ca
RUN mkdir /tmp/ca/server
RUN mkdir /tmp/ca/client
COPY gen-cert.sh /usr/local/bin/gen-cert.sh
EXPOSE 1883 

CMD /usr/local/bin/gen-cert.sh && mosquitto
