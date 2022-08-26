RELEASE=ugba88-old
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
