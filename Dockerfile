FROM mysql:8.0

ENV MYSQL_ROOT_PASSWORD=root

COPY initdb /docker-entrypoint-initdb.d

# Extraer y restaurar cada .sql.gz como una base de datos distinta
# Usamos un script para hacerlo al arranque

COPY restore.sh /docker-entrypoint-initdb.d/restore.sh
RUN chmod +x /docker-entrypoint-initdb.d/restore.sh
