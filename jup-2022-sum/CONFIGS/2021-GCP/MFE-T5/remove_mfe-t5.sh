RELEASE=mfe-t5
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
