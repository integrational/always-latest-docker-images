FROM openjdk:8-jre-slim

RUN apt update && apt upgrade -y && apt install curl unzip -y

RUN curl -o- 'https://s3.amazonaws.com/bat-wrapper/install.sh' | bash

WORKDIR /work

# does not work with /usr/local/bin/bat
ENTRYPOINT ["/root/.bat/bat/bin/bat"]
