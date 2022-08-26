RELEASE=devp229-fall-2021

NAMESPACE=devp229-fall-2021

helm upgrade --cleanup-on-fail \
  --debug  \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --values config-$RELEASE.yaml
