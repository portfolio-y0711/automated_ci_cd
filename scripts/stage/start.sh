#!/usr/bin/env bash

(cd subprojects/service-registry && yarn stage:start)
(cd subprojects/service-realtime && yarn stage:start)
(cd subprojects/service-api && yarn stage:start)
(cd subprojects/service-front && yarn stage:start)
sleep 1
(cd subprojects/service-gateway && yarn stage:start)
