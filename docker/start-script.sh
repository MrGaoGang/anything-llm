docker image prune --force
docker pull ghcr.io/mrgaogang/anything-llm:latest
docker stop ai-metaatem-prod
docker rm ai-metaatem-prod
export STORAGE_LOCATION=$HOME/anythingllm && mkdir -p $STORAGE_LOCATION && touch "$STORAGE_LOCATION/.env" && docker run -d -p 3001:3001 --name ai-metaatem-prod --cap-add SYS_ADMIN -v ${STORAGE_LOCATION}:/app/server/storage -v ${STORAGE_LOCATION}/.env:/app/server/.env -e STORAGE_DIR="/app/server/storage" ghcr.io/mrgaogang/anything-llm:latest