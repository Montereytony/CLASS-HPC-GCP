RELEASE=mba217
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
