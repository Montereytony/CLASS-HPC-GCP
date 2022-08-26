RELEASE=ugba88-fall-2021

NAMESPACE=ugba88-fall-2021

helm upgrade --cleanup-on-fail \
  --debug  \
  --timeout 30m \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --values config_$RELEASE.yaml
