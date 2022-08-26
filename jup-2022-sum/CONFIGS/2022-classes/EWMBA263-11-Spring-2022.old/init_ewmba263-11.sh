
RELEASE=ewmba263-11
NAMESPACE=ewmba263-11

helm -v 9 upgrade --cleanup-on-fail \
  --debug \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=0.9.0 \
  --values config_$RELEASE-1st.yaml
