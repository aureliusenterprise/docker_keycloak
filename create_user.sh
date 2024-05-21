#!/bin/bash

HOST=${HOST:-localhost}
PORT=${KEYCLOAK_PORT:-8080}
REALM_NAME=${KEYCLOAK_REALM_NAME:-"m4i"}
/opt/jboss/keycloak/bin/kcadm.sh config credentials --server "http://${HOST}:${PORT}/auth" --realm master --user admin --password $KEYCLOAK_PASSWORD
/opt/jboss/keycloak/bin/kcadm.sh create users -r "$REALM_NAME" -s username=$1 -s enabled=true
/opt/jboss/keycloak/bin/kcadm.sh add-roles -r "$REALM_NAME" --uusername $1 --rolename ATLAS_USER
/opt/jboss/keycloak/bin/kcadm.sh add-roles -r "$REALM_NAME" --uusername $1 --rolename $3
if [ $# -eq 4 ]
then
    /opt/jboss/keycloak/bin/kcadm.sh add-roles -r "$REALM_NAME" --uusername $1 --rolename $4
fi
/opt/jboss/keycloak/bin/kcadm.sh set-password -r "$REALM_NAME" --username $1 --new-password $2
