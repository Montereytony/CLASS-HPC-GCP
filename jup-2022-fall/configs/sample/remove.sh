RELEASE=ugba147-fall22
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
