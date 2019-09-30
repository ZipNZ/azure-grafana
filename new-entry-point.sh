#!/bin/bash
set -e

export GF_SERVER_HTTP_PORT=$PORT

exec "$@"