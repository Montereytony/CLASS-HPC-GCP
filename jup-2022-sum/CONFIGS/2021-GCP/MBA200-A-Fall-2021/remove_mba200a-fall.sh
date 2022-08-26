RELEASE=mba200a-fall-2021
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
