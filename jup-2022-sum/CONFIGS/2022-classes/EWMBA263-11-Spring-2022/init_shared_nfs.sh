
NAMESPACE=ewmba263-11-spring-2022

kubectl -n $NAMESPACE apply -f config_shared-pv.yaml
sleep 5
kubectl -n $NAMESPACE apply -f config_shared-pvc.yaml

