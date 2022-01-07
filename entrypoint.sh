#!/bin/bash
set -e

# REMOVE QUALQUER PRE-EXISTENTE server.pid DO Rails.
rm -f /myapp/tmp/pids/server.pid

# EXECUTA O PROCESSO PRINCIPAL CONTIDO NO Dockerfile
exec "$@"