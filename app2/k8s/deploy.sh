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
    --set image.tag=${appVersion} \
    | kubectl apply --namespace ${NAMESPACE} -f -