RELEASE=ugba147-fall22
NAMESPACE=ugba147-fall22

kubectl -n $NAMESPACE delete -f pvc.yaml
sleep 5
kubectl -n $NAMESPACE delete -f pv.yaml

