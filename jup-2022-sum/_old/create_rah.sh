RELEASE=rah
helm install $RELEASE jupyterhub/jupyterhub  --namespace=$RELEASE -f config_$RELEASE.yaml
