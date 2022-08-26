RELEASE=mfe230o
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
