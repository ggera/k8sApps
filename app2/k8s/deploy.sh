#!/usr/bin/env bash

NAMESPACE=geralabs

kubectl get ns ${NAMESPACE}

if [ $? -ne 0 ]
then
  kubectl create ns ${NAMESPACE}
fi

set -e
set +x

helm template ./helm \
    | kubectl apply --validate=false --namespace ${NAMESPACE} -f -