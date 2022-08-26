RELEASE=ugba199-fall-2021

NAMESPACE=ugba199-fall-2021

helm upgrade --cleanup-on-fail \
  --wait   \
  --timeout 30m \
  -v 9 \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --values config_$RELEASE.yaml
