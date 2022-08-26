
RELEASE=mba247-11-2021-win
NAMESPACE=mba247-11-2021-win

helm upgrade --cleanup-on-fail \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --values config_$RELEASE.yaml
