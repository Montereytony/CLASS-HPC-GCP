RELEASE=mba200a-fall-2021

NAMESPACE=mba200a-fall-2021

helm upgrade --cleanup-on-fail \
  --debug  \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --wait --timeout 20 \
  --values config_$RELEASE.yaml
