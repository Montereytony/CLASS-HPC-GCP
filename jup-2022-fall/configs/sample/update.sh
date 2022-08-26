RELEASE=ugba147-fall22
NAMESPACE=ugba147-fall22

helm upgrade --cleanup-on-fail \
  --debug  \
  --set global.safeToShowValues=true \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.11.0 \
  --timeout 10m30s --atomic \
  --values config.yaml
