RELEASE=ugba147
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
