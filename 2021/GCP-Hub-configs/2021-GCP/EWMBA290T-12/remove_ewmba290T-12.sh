RELEASE=ewmba290t-12
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
