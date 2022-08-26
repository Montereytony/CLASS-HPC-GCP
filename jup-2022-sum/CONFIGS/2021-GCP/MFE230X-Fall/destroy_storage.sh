#!/bin/sh 

RELEASE=mfe230x
NAMESPACE=mfe230x

kubectl -n mfe230x  delete -f config_shared_nfs_pvc.yaml

sleep 5

kubectl -n mfe230x  delete -f config_shared_nfs_pv.yaml
