#!/bin/bash
# 检查当前目录下是否存在 .env 文件
if [ ! -f "../server/storage/anythingllm.db" ]; then
    # 如果不存在，则复制 .env.example 为 .env
    touch server/storage/anythingllm.db
    echo "step1: anythingllm.db 文件已创建。"
else
    echo "step1: anythingllm.db 文件已存在，无需创建。"
fi
# 检查当前目录下是否存在 .env 文件
if [ ! -f ".env" ]; then
    # 如果不存在，则复制 .env.example 为 .env
    cp .env.example .env
    echo "step2: .env 文件已创建。"
else
    echo "step2: .env 文件已存在，无需创建。"
fi

# 获取第一个参数
ENV=$1

# 根据参数值执行不同的命令
if [ "$ENV" = "prod" ]; then
  echo "运行生产环境..."
  docker compose up -d --build  -e TAG=latest
else
  echo "运行开发环境..."
  docker compose up -d --build  -e TAG=dev
fi