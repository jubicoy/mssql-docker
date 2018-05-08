#!/bin/sh
envsubst < /app/template.sql > .create-script.sql
cat .create-script.sql
sleep 30s

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "${SA_PASSWORD}" -d master -i .create-script.sql
rm .create-script.sql