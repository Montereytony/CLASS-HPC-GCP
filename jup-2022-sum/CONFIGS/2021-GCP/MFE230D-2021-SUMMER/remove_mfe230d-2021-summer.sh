RELEASE=mfe230d
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
