#!/usr/bin/env bash

set -x

cd ../

./gradlew  clean bootJar

cd docker

if [ ! -d target ] ; then
	mkdir target
fi

cp ../build/libs/geralabs-app1-0.0.1-SNAPSHOT.jar target/.

docker build --tag geralabs-app1 .

docker tag geralabs-app1:latest gerawork/geralabs-cr:latest

docker push gerawork/geralabs-cr:latest