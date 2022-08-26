#kubectl create namespace rah
RELEASE=rah
NAMESPACE=rah
helm install --timeout 4800s $RELEASE jupyterhub/jupyterhub \
--namespace $NAMESPACE \
--version v0.9.0  \
--values config_rah-1st.yaml
