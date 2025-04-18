#!/bin/bash
set -e
echo "🔍 Current directory: $(pwd)"
echo "📦 Contents:"
ls -la


kubectl --insecure-skip-tls-verify=true apply -f k8s/namespace.yml
kubectl --insecure-skip-tls-verify=true apply -f k8s/secrets/backend-secrets.yml
kubectl --insecure-skip-tls-verify=true apply -f k8s/config/
kubectl --insecure-skip-tls-verify=true apply -f k8s/backend/


# kubectl apply -f ./namespace.yml
# kubectl apply -f ./secrets/backend-secrets.yml
# kubectl apply -f ./config/
# kubectl apply -f ./backend/
# kubectl apply -f k8s/frontend/




# chmod +x k8s-apply.sh
# ./k8s-apply.sh

