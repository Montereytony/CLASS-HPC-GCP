RELEASE=ewmba263-1
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
