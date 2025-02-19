#!/bin/bash

# docker stop eloquent_lichterman
# docker rm anythingllm
# docker rm eloquent_lichterman

docker-compose down

export STORAGE_LOCATION=$HOME/anythingllm && \
mkdir -p $STORAGE_LOCATION && \
touch "$STORAGE_LOCATION/.env" && \
docker run -d -p 3001:3001 \
--cap-add SYS_ADMIN \
-v ${STORAGE_LOCATION}:/app/server/storage \
-v ${STORAGE_LOCATION}/.env:/app/server/.env \
-e STORAGE_DIR="/app/server/storage" \
ghcr.io/mrgaogang/anything-llm:latest