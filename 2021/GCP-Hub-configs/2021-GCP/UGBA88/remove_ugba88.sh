RELEASE=ugba88
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
