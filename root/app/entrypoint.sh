#!/bin/bash
source /app/nss.sh

mkdir -p /volume/mssql

/app/populate.sh & /opt/mssql/bin/sqlservr
