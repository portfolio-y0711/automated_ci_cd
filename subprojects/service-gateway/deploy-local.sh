#!/bin/bash

source ./scripts/_0_validate-env.sh
source ./scripts/_0b_validate-registry-env.sh
source ./scripts/_1_check-run-process.sh
source ./scripts/_1b_wait-until-registry-run.sh
source ./scripts/_2_start-new-server.sh
source ./scripts/_3_health-check-terminate.sh
