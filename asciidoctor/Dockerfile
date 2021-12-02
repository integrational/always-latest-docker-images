FROM asciidoctor/docker-asciidoctor:latest
MAINTAINER gerald@integrational.eu

#
# Uses the official Asciidoctor image at https://hub.docker.com/r/asciidoctor/docker-asciidoctor at tag `latest` as the base image and patches it as follows:
# 
# - update the index of available apk packages
# - upgrade installed apk packages
# - install Python2 via apk, which Pygments requires
# - install the Pygments syntax highlighter gem
# 
# Otherwise behaves like the base image, so see the docs over there.
#

# upgrade and install
RUN apk update                                            \
 && apk upgrade                                           \
 && apk add python2 --no-cache --purge                    \
 && gem install pygments.rb --no-document --clear-sources \
 && rm -rf /var/cache/apk/*                               \
 && rm -rf /root/.gem
# 'gem cleanup' failed in the above RUN, removed it

# behave like base image
WORKDIR /documents
VOLUME  /documents
CMD     ["/bin/bash"]
