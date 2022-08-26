RELEASE=ewmba263-11
NAMESPACE=ewmba263-11

helm -v 8 --debug upgrade --cleanup-on-fail \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.11.0  \
  --values config_$RELEASE.yaml
