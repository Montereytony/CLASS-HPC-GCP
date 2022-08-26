RELEASE=mfe230d-2021-summer
NAMESPACE=mfe230d-2021-summer

helm upgrade --cleanup-on-fail \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --values config_$RELEASE.yaml
