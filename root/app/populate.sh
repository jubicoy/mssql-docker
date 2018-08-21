#!/bin/sh
envsubst < /app/template.sql > /tmp/.create-script.sql
sleep 30s

/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P "${SA_PASSWORD}" -d master -i /tmp/.create-script.sql
rm /tmp/.create-script.sql
