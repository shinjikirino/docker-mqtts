#!/bin/bash

docker run -d -v `pwd`/ca_client:/tmp/ca/client --name broker mq-broker
