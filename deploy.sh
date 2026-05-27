#!/bin/bash
set -e
cd cloud2

echo "=============================="
echo "Frontend Deploy"
echo "=============================="

cd frontend

# nginx html 폴더로 복사
sudo cp -r dist/* /var/www/html/
cd ..

echo "=============================="
echo "Backend Deploy"
echo "=============================="
cd backend

# deploy 폴더 생성
mkdir -p ../../deploy

# jar 복사
cp build/libs/*.jar ../../deploy/

cd ../../deploy

echo "=============================="
echo "Backend Run"
echo "=============================="

# 기존 실행중인 java 종료 (선택)
pkill -f "SNAPSHOT.jar" || true

# 백그라운드 실행
rm -f *-plain.jar
nohup java -jar *.jar > app.log 2>&1 &

echo "=============================="
echo "DEPLOY SUCCESS"
echo "=============================="