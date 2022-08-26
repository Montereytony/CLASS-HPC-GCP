
RELEASE=ewmba267-11

NAMESPACE=ewmba267-11

helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=0.11.0 \
  --values config_$RELEASE-1st.yaml
