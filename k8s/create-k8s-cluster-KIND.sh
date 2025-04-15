#!/bin/bash

CLUSTER_NAME="4-node-cluster"
CONFIG_FILE="/Users/souravchaudhary/multi-node-k8s-cluster.yaml"
KUBECONFIG_PATH="$HOME/.kube/config"

echo "🧹 Deleting existing kubeconfig..."
rm -f "$KUBECONFIG_PATH"

echo "🗑️  Deleting existing KIND cluster ($CLUSTER_NAME)..."
kind delete cluster --name "$CLUSTER_NAME"

echo "🚀 Creating new KIND cluster from config ($CONFIG_FILE)..."
kind create cluster --name "$CLUSTER_NAME" --config="$CONFIG_FILE"

echo "🔧 Exporting fresh kubeconfig..."
kind get kubeconfig --name "$CLUSTER_NAME" > "$KUBECONFIG_PATH"

echo "🩹 Patching server IP if 0.0.0.0 is detected..."
sed -i '' 's|https://0.0.0.0:|https://127.0.0.1:|' "$KUBECONFIG_PATH"

echo "✅ Done! Your cluster '$CLUSTER_NAME' is ready at 127.0.0.1"
kubectl get nodes



# chmod +x create-k8s-cluster-KIND.sh
# ./create-k8s-cluster-KIND.sh

