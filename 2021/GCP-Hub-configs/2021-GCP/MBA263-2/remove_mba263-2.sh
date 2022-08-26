RELEASE=mba263-2
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
