#!/bin/bash
# 检查当前目录下是否存在 .env 文件
if [ ! -f "../server/storage/anythingllm.db" ]; then
    # 如果不存在，则复制 .env.example 为 .env
    touch server/storage/anythingllm.db
    echo "step1: anythingllm.db 文件已创建。"
else
    echo "step1: anythingllm.db 文件已存在，无需创建。"
fi

# 获取第一个参数
ENV=$1

# 根据参数值执行不同的命令
if [ "$ENV" = "prod" ]; then
  echo "Run Pro env ..."
  # 检查当前目录下是否存在 .env 文件
    if [ ! -f ".env" ]; then
        # 如果不存在，则复制 .env.example 为 .env
        cp .env.dev .env
        echo ".env.dev to .env created。"
    else
        echo ".env has existed, no need to create."
    fi
else
  echo "Run Development env..."
  if [ ! -f ".env" ]; then
        # 如果不存在，则复制 .env.example 为 .env
        cp .env.example .env
        echo ".env.example to .env created。"
    else
        echo ".env has existed, no need to create."
    fi
fi

docker compose up -d --build
