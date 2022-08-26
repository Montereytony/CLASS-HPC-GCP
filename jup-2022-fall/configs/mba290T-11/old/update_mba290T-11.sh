
RELEASE=mba290t-11
NAMESPACE=mba290t-11

helm upgrade --cleanup-on-fail --debug \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --timeout 10m0s \
  --values config_$RELEASE.yaml
