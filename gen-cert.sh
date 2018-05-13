#!/bin/bash

set -eu

cd /tmp/ca && \
    yes '' | /usr/bin/openssl req -new -nodes -x509 -days 3650 -extensions v3_ca -keyout ca.key -out ca.crt
cd /tmp/ca/server && \
    yes '' |  /usr/bin/openssl genrsa -out server.key 2048 && \
    yes '' |  /usr/bin/openssl req -out server.csr -key server.key -new && \
    yes '' |  /usr/bin/openssl x509 -req -in server.csr -CA ../ca.crt -CAkey ../ca.key -CAcreateserial -out server.crt -days 365
cd /tmp/ca/client && \
    yes '' |  /usr/bin/openssl genrsa -out client.key 2048 && \
    yes '' |  /usr/bin/openssl req -out client.csr -key client.key -new && \
    yes '' |  /usr/bin/openssl x509 -req -in client.csr -CA ../ca.crt -CAkey ../ca.key -CAcreateserial -out client.crt -days 365
