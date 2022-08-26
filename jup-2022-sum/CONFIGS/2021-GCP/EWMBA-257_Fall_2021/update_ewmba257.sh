RELEASE=ewmba257-fall-2021

NAMESPACE=ewmba257-fall-2021

helm upgrade --cleanup-on-fail \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.9.0 \
  --values config_ewmba257.yaml
