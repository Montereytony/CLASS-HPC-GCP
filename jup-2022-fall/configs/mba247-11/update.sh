#
#
# Tony Cricelli 2022
#
# This script updates an existing Jupyterhub Deployment
#


RELEASE=mba247-11
NAMESPACE=mba247-11

helm upgrade --cleanup-on-fail \
  --debug  \
  --set global.safeToShowValues=true \
  $RELEASE jupyterhub/jupyterhub \
  --namespace $NAMESPACE \
  --timeout 10m30s \
  --version=0.11.0  \
  --values config.yaml
