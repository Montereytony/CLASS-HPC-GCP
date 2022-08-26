RELEASE=ewmba263-11
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
