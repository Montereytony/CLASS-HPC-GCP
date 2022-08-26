
RELEASE=mfe230o
NAMESPACE=mfe230o

helm upgrade --cleanup-on-fail \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --values config_$RELEASE.yaml
