#!/bin/bash

START = $SECONDS

terraform -chdir=/home/ub/My_exec/bashing  init
terraform -chdir=/home/ub/My_exec/bashing apply -auto-approve

printf "\n Time to complete = %s seconds" "$SECONDS"
