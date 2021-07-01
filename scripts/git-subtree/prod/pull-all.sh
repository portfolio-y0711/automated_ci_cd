#!/usr/bin/env bash

git subtree pull --prefix subprojects/service-registry @service-registry master
git subtree pull --prefix subprojects/service-api @service-api master
git subtree pull --prefix subprojects/service-front @service-front master
git subtree pull --prefix subprojects/service-gateway @service-gateway master
git subtree push --prefix subprojects/service-realtime @service-realtime main
