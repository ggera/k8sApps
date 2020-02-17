#!/usr/bin/env bash
NAMESPACE=geralabs

set -e
set +x

kubectl get ns ${NAMESPACE}

helm template ./helm \
    -f ${ENV_CONFIG} \
    | kubectl apply --namespace ${NAMESPACE} -f -
