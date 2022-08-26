RELEASE=ewmba257-fall-2021
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
