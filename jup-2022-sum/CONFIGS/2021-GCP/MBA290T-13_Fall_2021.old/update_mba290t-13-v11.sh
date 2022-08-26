RELEASE=mba290t-13-fall-2021

NAMESPACE=mba290t-13-fall-2021

helm upgrade --cleanup-on-fail \
  --debug  \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.11.0 \
  --wait --timeout 5m30s \
  --values config_mba290t-13-fall-2021-v11.yaml
