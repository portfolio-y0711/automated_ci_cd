#!/usr/bin/env bash

git subtree pull --prefix subprojects/service-registry @service-registry stage
git subtree pull --prefix subprojects/service-api @service-api stage
git subtree pull --prefix subprojects/service-front @service-front stage
git subtree pull --prefix subprojects/service-gateway @service-gateway stage
