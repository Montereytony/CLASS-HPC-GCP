RELEASE=mba247-11-2021-win
helm delete $RELEASE --namespace $RELEASE
kubectl delete namespace $RELEASE
