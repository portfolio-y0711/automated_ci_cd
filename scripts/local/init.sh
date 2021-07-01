#!/usr/bin/env bash

git remote add @service-registry http://192.168.56.102/portfolio-y0711/service-registry.git
git remote add @service-api http://192.168.56.102/portfolio-y0711/service-api.git
git remote add @service-front http://192.168.56.102/portfolio-y0711/service-front.git
git remote add @service-gateway http://192.168.56.102/portfolio-y0711/service-gateway.git
git remote add @service-realtime http://192.168.56.102/portfolio-y0711/service-realtime.git

git subtree add --prefix subprojects/service-gateway @service-gateway main
git subtree add --prefix subprojects/service-front @service-front main
git subtree add --prefix subprojects/service-api @service-api main
git subtree add --prefix subprojects/service-realtime @service-realtime main
git subtree add --prefix subprojects/service-registry @service-registry main