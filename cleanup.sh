#!/bin/sh

versions=(5.7 8.0)

echo "\n>>> stop container..."
docker-compose stop

echo "\n>>> rm container..."
docker-compose rm -f

for v in ${versions[@]}; do
    echo "\n>>> rm ${v} volumes..."
    if [ -e "./volumes/${v}/" ]; then    
        rm -rf "./volumes/${v}/"
    else
        echo " - ./volumes/${v}/ is not exists"
    fi

    echo "\n>>> make ${v} volumes..."
    mkdir -p "./volumes/${v}/config"
    mkdir -p "./volumes/${v}/data"
    mkdir -p "./volumes/${v}/entrypoint"

    echo "\n>>> setup ${v} init..."
    cp -a "./initfiles/config/my.cnf" "./volumes/${v}/config/my.cnf"
    cp -a "./initfiles/entrypoint/DDL.sql" "./volumes/${v}/entrypoint/DDL.sql"
done

echo "\n>>> cleanup completed"

exit 0
