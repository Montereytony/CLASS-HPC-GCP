#kubectl create namespace rah
RELEASE=rah
NAMESPACE=rah
helm upgrade --timeout 4800s --debug $RELEASE jupyterhub/jupyterhub \
--namespace $NAMESPACE \
--version 0.9.0  \
--values config_rah.yaml
