# Docker image for MuleSoft's Anypoint CLI

![Build and Push to Docker Hub](https://github.com/integrational/always-latest-docker-images/actions/workflows/build-tag-push-to-dockerhub.yml/badge.svg)

A [Docker image definition](Dockerfile) packaging MuleSoft's latest [Anypoint CLI](https://docs.mulesoft.com/runtime-manager/anypoint-platform-cli) on top of a Node base image.

## Usage

### Simple usage

Simple interactive usage:

```
docker run --pull always --rm -it integrational/anypoint-cli --username=user --password=pwd
```

Simple usage to execute a CLI command, e.g. `api-mgr api list -o json` against the `Staging` environment:

```
docker run --pull always --rm -it integrational/anypoint-cli --username=user --password=pwd --environment=Staging api-mgr api list -o json
```

=== Recommended usage

In `.bashrc` or similar, define an alias for running the Docker container:

```
alias anypoint-cli='docker run --pull always --rm -it -e ANYPOINT_USERNAME -e ANYPOINT_PASSWORD -v $(pwd):/work -w /work integrational/anypoint-cli'
```

and define the variables CLI uses for authentication (these can also be re-defined in the shell):

```
export ANYPOINT_USERNAME=user
export ANYPOINT_PASSWORD=pwd
```

Then, for interactive usage:

```
anypoint-cli
```

Or, to execute the above CLI command against the `Staging` environment:

```
anypoint-cli --environment=Staging api-mgr api list -o json
```
