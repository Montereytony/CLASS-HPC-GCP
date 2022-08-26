RELEASE=devp229-fall-2021

NAMESPACE=devp229-fall-2021

helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=0.9.0 \
  --values config-$RELEASE-1st.yaml
