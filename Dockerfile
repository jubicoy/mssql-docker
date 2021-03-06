FROM microsoft/mssql-server-linux

RUN apt-get update && \
    apt-get install -y gettext libnss-wrapper && \
    mkdir -p /var/opt/mssql /volume && \
    chmod -R 777 /var/opt/mssql

COPY root /

RUN cat /app/nss.sh >> /etc/bash.bashrc

RUN chmod +x /app/nss.sh /app/entrypoint.sh /app/populate.sh \
  && rm -rf /var/opt/mssql \
  && ln -s /volume/mssql /var/opt/ \
  && chmod -R 777 /volume

CMD /app/entrypoint.sh
