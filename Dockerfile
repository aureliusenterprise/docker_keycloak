FROM quay.io/keycloak/keycloak:16.1.0
LABEL maintainer="andreas.wombacher@aureliusenterprise.com"

COPY m4i /opt/jboss/keycloak/themes/m4i/

# For social authentication, copy logos from patternfly
COPY m4i/common/resources/node_modules/patternfly/dist/img/*-logo.svg /opt/jboss/keycloak/themes/m4i/login/resources/logos/

COPY create_user.sh /tmp/create_user.sh
COPY init_standard_users.sh /tmp/init_standard_users.sh
