RELEASE=ugba147-fall22
NAMESPACE=ugba147-fall22

kubectl -n $NAMESPACE delete -f nfs_shared_pvc.yaml
sleep 5
kubectl -n $NAMESPACE delete -f nfs_home_pvc.yaml
sleep 5
kubectl -n $NAMESPACE delete -f nfs_home_pv.yaml
sleep 5
kubectl -n $NAMESPACE delete -f nfs_shared_pv.yaml
