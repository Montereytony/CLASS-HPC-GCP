RELEASE=EW290T-12
helm install $RELEASE jupyterhub/jupyterhub  --namespace=$RELEASE -f config_$RELEASE.yaml
