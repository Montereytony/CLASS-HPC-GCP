RELEASE=ugba147-2021-summer
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
