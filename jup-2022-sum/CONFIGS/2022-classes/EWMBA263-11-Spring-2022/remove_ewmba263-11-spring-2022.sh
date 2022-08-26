RELEASE=ewmba263-11-spring-2022
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
