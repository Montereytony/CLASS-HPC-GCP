RELEASE=pierre
helm delete $RELEASE --namespace $RELEASE purge
kubectl delete namespace $RELEASE
