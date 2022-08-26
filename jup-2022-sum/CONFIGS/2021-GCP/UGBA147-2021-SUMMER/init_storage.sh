#!/bin/sh
NAMESPACE=ugba147-2021-summer
#kubectl apply -f init_shared_home_pv.yaml
#sleep 10
#kubectl apply -f init_shared_home_pvc.yaml
#sleep 10
#kubectl --namespace=$NAMESPACE apply -f init_shared_nfs_pv.yaml
#sleep 10
#kubectl --namespace=$NAMESPACE apply -f init_shared_nfs_pvc.yaml
#sleep 10
#kubectl --namespace=$NAMESPACE  get pvc
#kubectl --namespace=ugba147-2021-summer apply -f init_shared_nfs_pv2.yaml
#kubectl --namespace=ugba147-2021-summer apply -f init_shared_nfs_pvc2.yaml

kubectl --namespace=ugba147-2021-summer apply -f nfs_pv.yaml
kubectl --namespace=ugba147-2021-summer apply -f nfs_pvc.yaml
