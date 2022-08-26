
RELEASE=mba290t-13-fall-2021
NAMESPACE=mba290t-13-fall-2021
helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=0.9.0 \
  --values config_$RELEASE.yaml
