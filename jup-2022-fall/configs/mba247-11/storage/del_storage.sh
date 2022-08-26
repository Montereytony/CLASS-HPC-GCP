NAMESPACE=mba247-11

kubectl               patch pv mba247-11-pv       -p '{"metadata": {"finalizers": null}}'
kubectl               patch pv mba247-11-pv-sh    -p '{"metadata": {"finalizers": null}}'
kubectl -n $NAMESPACE patch pvc mba247-11-pvc-sh  -p '{"metadata": {"finalizers": null}}'
kubectl -n $NAMESPACE patch pvc mba247-11-pvc     -p '{"metadata": {"finalizers": null}}'

kubectl -n $NAMESPACE delete -f homes.yaml
kubectl -n $NAMESPACE delete -f shared.yaml
