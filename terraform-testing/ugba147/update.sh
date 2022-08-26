#
#
# Tony Cricelli 2022
#
# This script updates an existing Jupyterhub Deployment
#


RELEASE=ugba147-fall22
NAMESPACE=ugba147-fall22

helm upgrade --cleanup-on-fail \
  --debug  \
  --set global.safeToShowValues=true \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --timeout 10m30s \
  --version=0.11.0  \
  --values config.yaml
