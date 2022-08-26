#!/bin/bash
#
#
#
NAMESPACE=preterm2022
#
kubectl               patch pv  $NAMESPACE-pv      -p '{"metadata": {"finalizers": null}}'
kubectl               patch pv  $NAMESPACE-pv-sh   -p '{"metadata": {"finalizers": null}}'
kubectl -n $NAMESPACE patch pvc $NAMESPACE-pvc-sh  -p '{"metadata": {"finalizers": null}}'
kubectl -n $NAMESPACE patch pvc $NAMESPACE-pvc     -p '{"metadata": {"finalizers": null}}'
#
#
kubectl -n $NAMESPACE delete -f homes.yaml
kubectl -n $NAMESPACE delete -f shared.yaml
#
#
#  kubectl delete pv --force -grace-period=0

