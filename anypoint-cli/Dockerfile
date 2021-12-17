FROM node:latest
MAINTAINER gerald@integrational.eu

# Install basic set of packages needed in the following
RUN apt-get update     \
 && apt-get upgrade -y \
 && apt-get clean

RUN npm install -g npm@latest          \
 && npm install -g anypoint-cli@latest

WORKDIR    /work
ENTRYPOINT ["anypoint-cli"]
