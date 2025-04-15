# MYSQL BACKUP RESTORE IMAGE #

    Este proyecto contiene una imagen de Docker personalizada basada en MySQL 8, que restaura automáticamente tres bases de datos a partir de archivos .sql.gz comprimidos.

# 📁 ESTRUCTURA DEL PROYECTO #

    mysql-container/
    │
    ├── docker-compose.yml       # Orquesta el contenedor
    ├── Dockerfile               # Imagen personalizada de MySQL
    ├── ReadmeDB.md              # Este documento
    ├── initdb/
    │   ├── backup-baja.sql.gz   # Backup para la base de datos "db_baja"
    │   ├── backup-media.sql.gz  # Backup para la base de datos "db_media"
    │   └── backup-alta.sql.gz 	 # Backup para la base de datos "db_alta"
    └── restore.sh             	 # Script que crea las BDs y las restaura

# 🚀 ¿Qué hace esta imagen? #

   1. Construye un contenedor de MySQL 8 con contraseña de root (root).
   2. Crea automáticamente las bases de datos:
       - db_baja
       - db_media
       - db_alta
   3. Restaura los archivos .sql.gz en cada base correspondiente al arrancar el contenedor.

# ▶️ Uso local con Docker Compose #

    1. Construcción

        docker-compose build

    2. Arranque

        docker-compose up

    El contenedor estará disponible en el puerto 9999 con el usuario root y contraseña root.

# 🧪 Acceso a MySQL #

    Puedes conectarte con tu cliente MySQL favorito o desde consola:

    "C:/Program Files/MySQL/MySQL Server 8.4/bin/mysql.exe" -h 127.0.0.1 -P 9999 -u root -p


# 🔒 Variables de entorno #

    Actualmente configuradas directamente en el Dockerfile:

    - MYSQL_ROOT_PASSWORD=root

    Se puede adaptar para usar un archivo .env si lo deseas.

# 📝 Notas #

    - Los archivos .sql.gz deben estar ubicados en la carpeta initdb/.
    - Puedes agregar más backups si modificas el script restore.sh.
    - Esta imagen está pensada para restauraciones simples, no incluye usuarios personalizados o privilegios avanzados.

# 📬 Contacto #

    Si tienes dudas o deseas colaborar, no dudes en abrir un issue o un pull request.
