#!/usr/bin/env bash

(cd subprojects/service-api && yarn stop &)
(cd subprojects/service-front && yarn stop &)
sleep 3
(cd subprojects/service-gateway && yarn stop &)
sleep 3
(cd subprojects/service-realtime && yarn stop &)
(cd subprojects/service-registry && yarn stop &)