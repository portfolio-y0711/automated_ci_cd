#!/bin/bash

source ./scripts/_0_validate-env.sh
source ./scripts/_1_check-run-process.sh

if [ -z $1 ]; then
    source ./scripts/_4_stop-current-server.sh
elif [ $1 = true ]; then
    source ./scripts/_4b_stop-current-server.sh
fi