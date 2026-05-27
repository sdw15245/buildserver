#!/bin/bash

set -e

cd cloud2
echo "=============================="
echo "Frontend Build Start"
echo "=============================="


cd frontend

npm install
npm run build

cd ..

echo "=============================="
echo "Backend Build Start"
echo "=============================="

cd backend

chmod +x gradlew
./gradlew build

cd ..

echo "=============================="
echo "ALL BUILD SUCCESS"
echo "=============================="