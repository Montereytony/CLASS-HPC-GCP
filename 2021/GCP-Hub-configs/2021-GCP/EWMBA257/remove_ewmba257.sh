RELEASE=ewmba257
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
