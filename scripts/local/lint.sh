#!/usr/bin/env bash

(cd subprojects/service-registry && yarn lint)
(cd subprojects/service-api && yarn lint)
(cd subprojects/service-front && yarn lint)
(cd subprojects/service-realtime && yarn lint)
(cd subprojects/service-gateway && yarn lint)