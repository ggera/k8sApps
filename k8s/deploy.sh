#!/usr/bin/env bash

usage() { echo "Usage: $0 -c <country> -i infrastructure -e <environment>" 1>&2; exit 1; }

declare country=""
declare inf=""
declare env=""

# Initialize parameters specified from command line
while getopts ":c:e:i:" arg; do
	case "${arg}" in
		c)
			country=${OPTARG}
			;;
		e)
		    env=${OPTARG}
			;;
		i)
			inf=${OPTARG}
			;;

		esac
done
shift $((OPTIND-1))


if [[ -z "$country" ]]; then

    echo "country is required"
    usage
    exit 1
fi

if [[ -z "$inf" ]]; then

    echo "infrastructure is required"
    usage
    exit 1
fi

if [[ -z "$env" ]]; then

    echo "environment is required"
    usage
    exit 1
fi

NAMESPACE=${env}-paga

kubectl get ns ${NAMESPACE}

if [ $? -ne 0 ]
then
  echo "Please create ${NAMESPACE} with paga-infrastructure-k8s project first!"
  exit 1
fi

kubectl apply --namespace $NAMESPACE -f templates/