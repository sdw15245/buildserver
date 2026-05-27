#!/bin/bash

set -e

# ROOT_DIR 환경변수 사용
if [ -z "$ROOT_DIR" ]; then
    echo "ERROR: ROOT_DIR environment variable is not set."
    exit 1
fi

echo "ROOT_DIR = $ROOT_DIR"

echo "=============================="
echo "Frontend Build Start"
echo "=============================="

cd "$ROOT_DIR/frontend"

npm install
npm run build

echo "=============================="
echo "Backend Build Start"
echo "=============================="

cd "$ROOT_DIR/backend"

chmod +x gradlew
./gradlew build

echo "=============================="
echo "ALL BUILD SUCCESS"
echo "=============================="
