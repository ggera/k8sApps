#!/usr/bin/env bash

set -x

cd ../

./gradlew  clean bootJar

cd docker

if [ ! -d target ] ; then
	mkdir target
fi

cp ../build/libs/geralabs-app2-0.0.1-SNAPSHOT.jar target/.

docker build --tag geralabs-app2 .

docker tag geralabs-app2:latest gerawork/geralabs-cr:latest

docker push gerawork/geralabs-cr:latest

