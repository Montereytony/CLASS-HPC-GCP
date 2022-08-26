NAMESPACE=ugba147-fall22
kubectl -n $NAMESPACE apply -f make_home.yaml
kubectl -n $NAMESPACE apply -f make_share.yaml
