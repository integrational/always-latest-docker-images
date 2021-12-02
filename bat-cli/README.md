# MuleSoft BAT CLI Docker Image

![Build and Push to Docker Hub](https://github.com/integrational/always-latest-docker-images/actions/workflows/build-tag-push-to-dockerhub.yml/badge.svg)

Docker image with [MuleSoft's BAT CLI](https://docs.mulesoft.com/api-functional-monitoring/bat-top) on top of a suitable Java runtime.

Default workdir is `/work`.

```
docker run --pull always --rm -t \
           -v $(pwd):/work       \
           integrational/bat-cli
```
