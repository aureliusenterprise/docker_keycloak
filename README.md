# docker_keycloak

Docker image with `keycloak:16.1.0` modified for Aurelius Atlas needs. For the documentation of `keycloak:16.1.0` refer to https://github.com/keycloak/keycloak-documentation/tree/16.1.0.
## Environment variables
To configure the container you should specify the following environment variables:

| variable | description | required |
| - | - | - |
| KEYCLOAK_USER | Keycloak admin username | yes |
| KEYCLOAK_PASSWORD | Keycloak admin password | yes |
| KEYCLOAK_REALM_NAME | your atlas realm name; used by create_user.sh | no (default: `m4i`) |
| KEYCLOAK_PORT | Keycloak server port; used by create_user.sh | no (default: `8080`) |
| KEYCLOAK_IMPORT | path to realm file to be imported on startup | no |

## Build

```bash
# Set a tag
TAG=<your_tag>
# Build the image
docker build -t aureliusatlas/docker-keycloak:$TAG .
```
## Push
```bash
# Login to Dockerhub
docker login --username=aureliusatlas
# Push the image
docker push aureliusatlas/docker-keycloak:$TAG
```
