#!/bin/bash
set -euo pipefail

if [ "$(docker network ls | grep -c iuxt)" -eq 0 ]; then
  docker network create iuxt
else
  echo "docker network iuxt exists skip"
fi

docker run -d --name v2ray -p 13211:13211 \
  --network iuxt \
  --restart always \
  iuxt/v2ray
