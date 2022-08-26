RELEASE=mba290t-13
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
