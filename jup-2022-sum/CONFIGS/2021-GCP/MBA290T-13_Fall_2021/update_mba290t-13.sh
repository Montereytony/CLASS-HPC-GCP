RELEASE=mba290t-13
NAMESPACE=mba290t-13

helm upgrade --cleanup-on-fail  \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --wait --timeout 2m30s \
  --values config_$RELEASE.yaml
