#!/bin/sh

kubectl apply -n mfe230e -f install_nfs_pv.yaml \
 && \
kubectl apply -n mfe230e -f install_nfs_pvc.yaml
