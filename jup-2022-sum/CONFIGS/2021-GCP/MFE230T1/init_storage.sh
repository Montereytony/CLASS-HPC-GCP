#!/bin/sh 

RELEASE=mfe230x
NAMESPACE=mfe230x

kubectl -n mfe230x  apply -f config_shared_nfs_pv.yaml

sleep 5
kubectl -n mfe230x  apply -f config_shared_nfs_pvc.yaml
