NAMESPACE=mba247-11

kubectl create namespace $NAMESPACE
kubectl -n $NAMESPACE apply -f homes.yaml
kubectl -n $NAMESPACE apply -f shared.yaml
