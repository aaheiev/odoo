#!/bin/bash

[[ -s ${ODOO_PASSWORD_FILE}  ]] && ODOO_PASSWORD=$(cat ${ODOO_PASSWORD_FILE})
[[ -z "$POSTGRES_USER" ]] && POSTGRES_USER=postgres
SQL="CREATE ROLE odoo PASSWORD '${ODOO_PASSWORD}' NOSUPERUSER CREATEDB CREATEROLE INHERIT LOGIN;"
psql -U ${POSTGRES_USER} -c "${SQL}"
