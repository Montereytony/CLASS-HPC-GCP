RELEASE=mfe230e
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
