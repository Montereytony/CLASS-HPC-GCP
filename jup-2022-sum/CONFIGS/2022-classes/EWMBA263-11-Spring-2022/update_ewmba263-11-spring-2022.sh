RELEASE=ewmba263-11-spring-2022

NAMESPACE=ewmba263-11-spring-2022

helm upgrade --cleanup-on-fail \
  --debug  \
  --set global.safeToShowValues=true \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --version=0.11.0 \
  --timeout 0m30s --atomic \
  --values config_$RELEASE.yaml
