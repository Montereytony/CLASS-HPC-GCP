
NAMESPACE=ugba88-fall-2021

kubectl -n $NAMESPACE apply -f config_shared-pv.yaml
sleep 5
kubectl -n $NAMESPACE apply -f config_shared-pvc.yaml

