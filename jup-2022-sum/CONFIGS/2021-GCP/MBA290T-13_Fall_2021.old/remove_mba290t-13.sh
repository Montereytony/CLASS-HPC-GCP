RELEASE=mba290t-13-fall-2021
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
