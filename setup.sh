#!/bin/sh

sh cleanup.sh

if [ -e ".env" ]; then
  echo "\n>>> rm .env..."
  rm .env
fi

echo "\n>>> make .env..."
touch .env

echo "\n>>> input password..."
read -p " - MYSQL_ROOT_PASSWORD : " MYSQL_ROOT_PASSWORD
read -p " - MYSQL_PASSWORD : " MYSQL_PASSWORD
echo "MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}" >> .env
echo "MYSQL_PASSWORD=${MYSQL_PASSWORD}" >> .env

echo "\n>>> container up..."
docker-compose up -d

echo "\n>>> setup completed"

exit 0

