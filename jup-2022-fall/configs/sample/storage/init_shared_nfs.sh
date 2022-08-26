
NAMESPACE=ugba147-fall22

kubectl -n $NAMESPACE apply -f nfs_shared_pv.yaml
sleep 5
kubectl -n $NAMESPACE apply -f nfs_shared_pvc.yaml
