
RELEASE=mba263-2
NAMESPACE=mba263-2

helm upgrade --cleanup-on-fail \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --values config_$RELEASE.yaml
