#!/usr/bin/env bash

(cd subprojects/service-api && yarn stage:stop)
(cd subprojects/service-front && yarn stage:stop)
(cd subprojects/service-realtime && yarn stage:stop)
sleep 1
(cd subprojects/service-gateway && yarn stage:stop)
(cd subprojects/service-registry && yarn stage:stop)
