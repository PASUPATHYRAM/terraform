#! /bin/bash

start=$SECONDS

terraform -chdir=/home/ub/My_exec/bashing  destroy -auto-approve

printf "\n time to complete = %s seconds" "$SECONDS"

