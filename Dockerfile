FROM quay.io/keycloak/keycloak:16.1.0
LABEL maintainer="andreas.wombacher@aureliusenterprise.com"

COPY m4i /opt/jboss/keycloak/themes/m4i/ 

COPY create_user.sh /tmp/create_user.sh
COPY init_standard_users.sh /tmp/init_standard_users.sh