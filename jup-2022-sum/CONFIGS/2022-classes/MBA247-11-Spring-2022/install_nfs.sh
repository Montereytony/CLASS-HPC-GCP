#!/bin/sh

kubectl apply -n mba247-11-2021-win -f nfs_pv.yaml   \
 && \
kubectl apply -n mba247-11-2021-win -f nfs_pvc.yaml   \
