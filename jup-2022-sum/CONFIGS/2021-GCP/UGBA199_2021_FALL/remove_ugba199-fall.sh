RELEASE=ugba199-fall-2021
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
