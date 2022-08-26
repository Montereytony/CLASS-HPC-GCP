
RELEASE=ugba147

NAMESPACE=ugba147

helm upgrade --cleanup-on-fail \
  --install $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --create-namespace \
  --version=0.9.0 \
  --values config_$RELEASE-1st.yaml


#kubectl create namespace $RELEASE
#helm install $RELEASE jupyterhub/jupyterhub \
#    --version=0.8.2 \
#    --namespace=$RELEASE \
#    -f config_$RELEASE-1st.yaml
