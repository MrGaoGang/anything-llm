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

# 定义函数：创建或检查 .env.production 文件
create_or_check_env_file() {
  local file_path="$1"  # 文件路径作为参数传入
  local content="$2"    # 文件内容作为参数传入

  # 检查文件是否存在
  if [ ! -f "$file_path" ]; then
    # 文件不存在，创建文件并写入内容
    echo "$content" > "$file_path"
    echo "前端环境配置文件已创建并写入内容: $file_path"
  else
    # 文件已存在
    echo "前端环境配置文件已存在: $file_path"
  fi
}

# 调用函数
FILE_PATH="../frontend/.env.production"
CONTENT="VITE_API_BASE='http://chat-api.metaatem.cn:3001/api'"


# 根据参数值执行不同的命令
if [ "$ENV" = "prod" ]; then
  echo "Run Pro env ..."
  # 检查当前目录下是否存在 .env 文件
    if [ ! -f ".env" ]; then
        # 如果不存在，则复制 .env.example 为 .env
        cp .env.example .env
        echo ".env.example to .env created。"
    else
        echo ".env has existed, no need to create."
    fi
    create_or_check_env_file "$FILE_PATH" "$CONTENT"
else
  echo "Run Development env..."
  if [ ! -f ".env" ]; then
        # 如果不存在，则复制 .env.example 为 .env
        cp .env.dev .env
        echo ".env.dev to .env created。"
    else
        echo ".env has existed, no need to create."
    fi
fi

docker compose up -d --build
