#!/bin/bash

SERVER=$(grep 'server:' ~/.kube/config | awk '{print $2}')
PORT=$(echo "$SERVER" | grep -oE '[0-9]+$')

if ping -c 1 -W 1 host.docker.internal &>/dev/null; then
  echo "👉 Inside Docker/Jenkins - using host.docker.internal"
  NEW_HOST="host.docker.internal"
else
  echo "✅ On Mac host - using 127.0.0.1"
  NEW_HOST="127.0.0.1"
fi

sed -i '' "s|server: .*|server: https://$NEW_HOST:$PORT|" ~/.kube/config

kubectl "$@"








# ./kube-dns-node.sh


# cat ~/.kube/config

# rm -rf ~/.kube/config
# kind delete cluster --name 4-node-cluster
# kind create cluster --name 4-node-cluster --config=multi-node-k8s-cluster.yaml
# kind get kubeconfig --name 4-node-cluster > ~/.kube/config
# sed -i '' 's|https://0.0.0.0:|https://127.0.0.1:|' ~/.kube/config
