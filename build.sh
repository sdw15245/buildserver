#!/bin/bash

set -e

cd cloudTest
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