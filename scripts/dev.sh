#!/usr/bin/env bash
(cd subprojects/service-registry && yarn dev &)
sleep 5
(cd subprojects/service-api && yarn dev &)
(cd subprojects/service-front && yarn dev &)
(cd subprojects/service-gateway && yarn dev &)