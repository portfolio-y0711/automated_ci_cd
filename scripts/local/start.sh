#!/usr/bin/env bash

(cd subprojects/service-registry && yarn start &)
sleep 5
(cd subprojects/service-api && yarn start &)
(cd subprojects/service-front && yarn start &)
(cd subprojects/service-realtime && yarn start &)
(cd subprojects/service-gateway && yarn start &)
