#!/usr/bin/env bash

(cd subprojects/service-api && yarn remote:stop)
(cd subprojects/service-front && yarn remote:stop)
(cd subprojects/service-gateway && yarn remote:stop)
(cd subprojects/service-realtime && yarn remote:stop)
sleep 3
(cd subprojects/service-registry && yarn remote:stop)