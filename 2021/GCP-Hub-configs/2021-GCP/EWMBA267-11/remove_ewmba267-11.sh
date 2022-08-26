RELEASE=ewmba267-11
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
