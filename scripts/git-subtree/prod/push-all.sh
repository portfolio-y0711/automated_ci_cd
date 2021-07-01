#!/usr/bin/env bash

git subtree push --prefix subprojects/service-registry @service-registry master
git subtree push --prefix subprojects/service-api @service-api master
git subtree push --prefix subprojects/service-front @service-front master
git subtree push --prefix subprojects/service-gateway @service-gateway master
