RELEASE=ugba147-fall22
NAMESPACE=ugba147-fall22

helm upgrade --cleanup-on-fail \
	--debug \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE  \
  --version=0.11.1\
  --wait --timeout=10m30s \
  --values config-1st.yaml
# --create-namespace --wait \
