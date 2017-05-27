#!/bin/bash
set -e

#create deployment user and set password
if [ ! -f docker_initialized ]; then
	useradd -d /var/www/$UNIT/$PROJECT_NAME/ -g www-data -s /bin/bash $USER
	usermod -p $(echo $PASSWORD | openssl passwd -1 -stdin) $USER
	touch docker_initialized
fi

exec "$@"
