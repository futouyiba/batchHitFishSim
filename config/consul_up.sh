#!/bin/bash

# 指定 Consul 服务器的地址
# export CONSUL_HTTP_ADDR=http://192.168.1.58:8500

# 指定本地文件所在的目录
LOCAL_DIR="data"

APP_HEAD="fancy/fisher"

# 遍历指定目录下的所有 .json 文件
for file in $(find $LOCAL_DIR -type f); do
    # 获取文件名（不包括扩展名），用于作为 Consul KV 的键
    key=$(basename -- "$file")
    key="${key%.*}"

    # 获取文件的相对路径，用于构建 Consul KV 的键
    relative_path=$(realpath --relative-to="$LOCAL_DIR" "$file")
    relative_path="${relative_path%/*}"  # 移除文件名部分

    # 构建 Consul KV 的完整键
    full_key="$APP_HEAD/${relative_path//\\/}/${key}"  # 使用双斜杠转义单个斜杠

    # 使用 Consul CLI 将文件内容读取并上传到 Consul KV
    data=`cat $file`
    consul kv put "$full_key"  "$data"
done
