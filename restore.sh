#!/bin/bash
set -e

echo "Esperando que MySQL arranque..."

until mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e ""; do
  sleep 1
done

echo "Creando bases de datos..."
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS db_baja;"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS db_media;"
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS db_alta;"

echo "Restaurando backups..."
gunzip -c /docker-entrypoint-initdb.d/backup-baja.sql.gz | mysql -uroot -p"$MYSQL_ROOT_PASSWORD" db_baja
gunzip -c /docker-entrypoint-initdb.d/backup-media.sql.gz | mysql -uroot -p"$MYSQL_ROOT_PASSWORD" db_media
gunzip -c /docker-entrypoint-initdb.d/backup-alta.sql.gz | mysql -uroot -p"$MYSQL_ROOT_PASSWORD" db_alta

echo "Restauración completada."
