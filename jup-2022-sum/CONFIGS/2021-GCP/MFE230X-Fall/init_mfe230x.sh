RELEASE=mfe230x
NAMESPACE=mfe230x

helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=0.9.0 \
  --values config_$RELEASE-1st.yaml
