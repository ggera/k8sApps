#!/usr/bin/env bash
NAMESPACE=geralabs

set -e
set +x

kubectl get ns ${NAMESPACE}

helm template ./helm \
    | kubectl apply --namespace ${NAMESPACE} -f - --validate=false

