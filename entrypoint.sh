#!/bin/sh
set -e

FORCED_USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID: $FORCED_USER_ID"

useradd --shell /bin/bash --no-create-home --home $HOME -u $FORCED_USER_ID -o -c "" stephane

chown -R $FORCED_USER_ID $HOME

exec gosu stephane "$@"
