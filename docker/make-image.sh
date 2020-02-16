#!/usr/bin/env bash

usage() { echo "Usage: $0 -v <app version>" 1>&2; exit 1; }

set -e

declare appVersion=""


# Initialize parameters specified from command line
while getopts ":v:" arg; do
	case "${arg}" in
		v)
			appVersion=${OPTARG}
			;;

		esac
done
shift $((OPTIND-1))

if [[ -z "$appVersion" ]]; then

    echo "appVersion is required"
    usage
    exit 1
fi

set -x

CWD=`pwd`

cd ../

rm -f build/libs/*.jar

# skip tests untill proper environment application.properties is created
./gradlew bootJar

cd "$CWD"

if [ ! -d target ] ; then
	mkdir target
fi

cp ../build/libs/paycheck-services-0.0.1-SNAPSHOT.jar target/.

docker build --tag services:${appVersion} .

