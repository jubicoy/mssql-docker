FROM microsoft/mssql-server-linux

RUN apt-get update && \
    apt-get install -y gettext

COPY root /

RUN chmod +x /app/entrypoint.sh /app/populate.sh

CMD /app/entrypoint.sh