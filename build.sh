#!/bin/sh

which docker 2>&1 > /dev/null
if [ $? -ne 0 ]; then
    echo '- Docker not found. Please install Docker before use.'
    exit 1
fi

which dockle 2>&1 > /dev/null
if [ $? -ne 0 ]; then
    echo '- Dockle not found. Please install Dockle before use.'
    exit 1
fi

echo '- Building: Docker image ...'
export DOCKER_CONTENT_TRUST=1 && \
docker build --no-cache -t my_image:my_test . && \
echo '- Auditing Security: Docker image ...' && \
dockle --debug --clear-cache my_image:my_test
