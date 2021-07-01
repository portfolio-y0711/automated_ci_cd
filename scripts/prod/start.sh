#!/usr/bin/env bash

(cd subprojects/service-registry && yarn remote:start)
(cd subprojects/service-api && yarn remote:start)
(cd subprojects/service-front && yarn remote:start)
(cd subprojects/service-realtime && yarn remote:start)
sleep 1
(cd subprojects/service-gateway && yarn remote:start)
