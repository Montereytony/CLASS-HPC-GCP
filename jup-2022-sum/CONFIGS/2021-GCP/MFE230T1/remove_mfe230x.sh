RELEASE=mfe230x
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
