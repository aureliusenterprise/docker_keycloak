#!/bin/bash

HOST=${HOST:-localhost}
PORT=${KEYCLOAK_PORT:-8080}
while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' curl \
                 -X GET "http://${HOST}:${PORT}/" | tail -c 3)" != "200" ]]; do
    echo 'Waiting for service.'
    sleep 5;
done;
sleep 5;
/tmp/create_user.sh atlas ${USER_ATLAS_PASSWORD} ROLE_ADMIN DATA_STEWARD;
/tmp/create_user.sh steward ${USER_STEWARD_PASSWORD} DATA_STEWARD;
/tmp/create_user.sh scientist ${USER_DATA_PASSWORD} DATA_SCIENTIST;
