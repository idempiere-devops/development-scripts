#!/bin/bash

set -e

if [[ -z "${IDEMPIERE_REPOSITORY}" ]]; then
    echo "First define the variable \$IDEMPIERE_REPOSITORY"
fi

export PGPASSWORD="postgres"

psql -h localhost -U postgres -c "CREATE ROLE adempiere SUPERUSER LOGIN PASSWORD 'adempiere'"

export PGPASSWORD="adempiere"

createdb -h localhost --template=template0 -E UNICODE -O adempiere -U adempiere idempiere
psql -h localhost -d idempiere -U adempiere -c "ALTER ROLE adempiere SET search_path TO adempiere, pg_catalog"
psql -h localhost -d idempiere -U adempiere -c 'CREATE EXTENSION "uuid-ossp"'

jar xvf $IDEMPIERE_REPOSITORY/org.adempiere.server-feature/data/seed/Adempiere_pg.jar
psql -h localhost -d idempiere -U adempiere -f Adempiere_pg.dmp