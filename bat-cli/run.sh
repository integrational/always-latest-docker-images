#!/bin/bash

img=integrational/bat-cli

docker run --rm --name bat-cli -t \
           -v $(pwd):/work        \
           $img $*
