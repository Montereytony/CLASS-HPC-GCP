#!/bin/sh

NAMESPACE=mfe230d-2021-summer

#kubectl apply -f init_shared_home_pv.yaml
#sleep 10
#kubectl apply -f init_shared_home_pvc.yaml
#sleep 10

kubectl --namespace=$NAMESPACE apply -f init_shared_nfs_pv.yaml
sleep 10
kubectl --namespace=$NAMESPACE apply -f init_shared_nfs_pvc.yaml
sleep 10

kubectl --namespace=$NAMESPACE  get pvc

