#!/usr/bin/env bash

(cd subprojects/service-registry && yarn probe)
(cd subprojects/service-api && yarn probe)
(cd subprojects/service-front && yarn probe)
(cd subprojects/service-realtime && yarn probe)
(cd subprojects/service-gateway && yarn probe)
