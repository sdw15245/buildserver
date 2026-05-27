#!/bin/bash

set -e

# 반드시 환경변수 필요    , ${변수:?에러메시지}
: "${ROOT_DIR:?ROOT_DIR is not set}"

echo "ROOT_DIR = $ROOT_DIR"

echo "=============================="
echo "Frontend Deploy"
echo "=============================="

cd "$ROOT_DIR/frontend"

sudo cp -r dist/* /var/www/html/

echo "=============================="
echo "Backend Deploy"
echo "=============================="

cd "$ROOT_DIR/backend"

# 상위(workspaces)에 deploy 생성
mkdir -p "$ROOT_DIR/../deploy"

# jar 복사
cp build/libs/*.jar "$ROOT_DIR/../deploy/"

cd "$ROOT_DIR/../deploy"

echo "=============================="
echo "Backend Run"
echo "=============================="

pkill -f "SNAPSHOT.jar" || true

rm -f *-plain.jar

nohup java -jar *.jar --spring.profiles.active=prod >> app.log 2>&1 &

echo "=============================="
echo "DEPLOY SUCCESS"
echo "=============================="
