#!/usr/bin/env bash

(cd subprojects/service-registry && yarn remote:probe)
(cd subprojects/service-api && yarn remote:probe)
(cd subprojects/service-front && yarn remote:probe)
(cd subprojects/service-gateway && yarn remote:probe)
(cd subprojects/service-realtime && yarn remote:probe)