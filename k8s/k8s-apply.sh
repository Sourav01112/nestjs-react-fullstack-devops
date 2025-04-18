#!/bin/bash
set -e

kubectl --insecure-skip-tls-verify=true apply -f namespace.yml
kubectl --insecure-skip-tls-verify=true apply -f secrets/backend-secrets.yml
kubectl --insecure-skip-tls-verify=true apply -f config/
kubectl --insecure-skip-tls-verify=true apply -f backend/


# kubectl apply -f ./namespace.yml
# kubectl apply -f ./secrets/backend-secrets.yml
# kubectl apply -f ./config/
# kubectl apply -f ./backend/
# kubectl apply -f k8s/frontend/




# chmod +x k8s-apply.sh
# ./k8s-apply.sh

