#!/usr/bin/env bash

(cd subprojects/service-registry && yarn stage:probe)
(cd subprojects/service-api && yarn stage:probe)
(cd subprojects/service-front && yarn stage:probe)
(cd subprojects/service-realtime && yarn stage:probe)
(cd subprojects/service-gateway && yarn stage:probe)
