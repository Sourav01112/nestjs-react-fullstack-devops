kubectl apply -f ./namespace.yml
kubectl apply -f ./secrets/backend-secrets.yml
kubectl apply -f ./config/
kubectl apply -f ./backend/
# kubectl apply -f k8s/frontend/




# chmod +x k8s-apply.sh
# ./k8s-apply.sh

