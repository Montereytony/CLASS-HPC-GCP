NAMESPACE=ugba88


kubectl               patch pv  $NAMESPACE-pv       -p '{"metadata": {"finalizers": null}}'
kubectl               patch pv  $NAMESPACE-pv-sh    -p '{"metadata": {"finalizers": null}}'
kubectl -n $NAMESPACE patch pvc $NAMESPACE-pvc     -p '{"metadata": {"finalizers": null}}'
kubectl -n $NAMESPACE patch pvc $NAMESPACE-pvc-sh  -p '{"metadata": {"finalizers": null}}'


kubectl -n $NAMESPACE delete -f homes.yaml
kubectl -n $NAMESPACE delete -f shared.yaml
# kubectl delete pv pvc-521d9a78-dba4–11e8-b576–12241a2479c2 — force — grace-period=0
