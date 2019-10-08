#!/bin/bash
set -e

export GF_SERVER_HTTP_PORT=$PORT

if [ ! -z "$SSH_PORT" ]
then
    # Start the SSH server.
    sed -i "s/SSH_PORT/$SSH_PORT/g" /etc/ssh/sshd_config
    service ssh start
fi


exec "$@"