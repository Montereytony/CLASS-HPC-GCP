
RELEASE=mfe230d-2021-summer

NAMESPACE=mfe230d-2021-summer

helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=0.9.0 \
  --values config_$RELEASE-1st.yaml
