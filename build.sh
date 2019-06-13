#!/bin/sh

which dockle 2>&1 > /dev/null
if [ $? -ne 0 ]; then
   echo '- Dockle not found. Please install dockle before use.'
   exit 1
fi

export DOCKER_CONTENT_TRUST=1 && \
docker build --no-cache -t my_image:my_test . && \
dockle --debug --clear-cache my_image:my_test
