#!/bin/bash

set -e

if [[ -z "${IDEMPIERE_REPOSITORY}" ]]; then
    echo "First define the variable \$IDEMPIERE_REPOSITORY"
fi

bash "${IDEMPIERE_REPOSITORY}/RUN_SyncDBDev.sh"