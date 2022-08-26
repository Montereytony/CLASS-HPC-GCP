RELEASE=mfe230t-1
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
