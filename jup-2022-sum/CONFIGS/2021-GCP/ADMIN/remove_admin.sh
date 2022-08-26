RELEASE=admin
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
