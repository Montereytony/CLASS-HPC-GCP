RELEASE=ewmba263-11-spring-2022

NAMESPACE=ewmba263-11-spring-2022

helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=0.9.0 \
  --values config_$RELEASE-1st.yaml
