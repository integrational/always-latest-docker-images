FROM openjdk:8-jre-slim
MAINTAINER gerald@integrational.eu

RUN apt-get update                             \
 && apt-get upgrade -y                         \
 && apt-get install -y --no-install-recommends \
            curl unzip                         \
 && apt-get clean

RUN curl -o- 'https://s3.amazonaws.com/bat-wrapper/install.sh' | bash

WORKDIR /work

# does not work with /usr/local/bin/bat
ENTRYPOINT ["/root/.bat/bat/bin/bat"]
