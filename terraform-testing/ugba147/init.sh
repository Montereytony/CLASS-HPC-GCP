#
#
# Tony Cricelli  2022
# init script to get cluster IP
#
#

RELEASE=ugba147-fall22
NAMESPACE=ugba147-fall22

helm upgrade --cleanup-on-fail \
             --debug \
             --install $RELEASE jupyterhub/jupyterhub \
             --namespace $NAMESPACE  \
             --wait --timeout=10m30s \
             --version=0.11.1\
             --values config-1st.yaml
