#!/usr/bin/env bash

git subtree push --prefix subprojects/service-registry @service-registry stage
git subtree push --prefix subprojects/service-api @service-api stage
git subtree push --prefix subprojects/service-front @service-front stage
git subtree push --prefix subprojects/service-gateway @service-gateway stage
