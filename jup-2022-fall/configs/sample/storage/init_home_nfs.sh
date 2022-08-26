NAMESPACE=ugba147-fall22
kubectl -n $NAMESPACE apply -f nfs_home_pv.yaml
sleep 5
kubectl -n $NAMESPACE apply -f nfs_home_pvc.yaml
