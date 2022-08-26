helm install rah jupyterhub/jupyterhub \
    --version=0.8.2 \
    --namespace=rah \
    -f config_rah-1st.yaml
