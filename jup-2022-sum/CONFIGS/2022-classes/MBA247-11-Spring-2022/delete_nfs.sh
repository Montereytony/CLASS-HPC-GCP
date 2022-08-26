#!/bin/sh

kubectl delete -n mba247-11-2021-win -f nfs_pvc.yaml \
 && \
kubectl delete -n mba247-11-2021-win -f nfs_pv.yaml 
