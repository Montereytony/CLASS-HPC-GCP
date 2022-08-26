#!/bin/sh
NAMESPACE=ugba147-2021-summer

kubectl --namespace=ugba147-2021-summer apply -f nfs_pv.yaml
sleep 10
kubectl --namespace=ugba147-2021-summer apply -f nfs_pvc.yaml
