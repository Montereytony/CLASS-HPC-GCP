#!/bin/sh

gcloud config set project haas-jupyter-jub
gcloud config set compute/zone  us-central1-b

gcloud container clusters create \
--enable-ip-alias \
--enable-autoscaling \
--max-nodes=50 --min-nodes=1 \
--zone=us-central1-b \
--node-locations=us-central1-b \
--image-type=ubuntu \
--disk-size=100 --disk-type=pd-standard \
--cluster-version latest \
--no-enable-autoupgrade \
--enable-network-policy \
--create-subnetwork="" \
--tags=hub-cluster \
--machine-type "n1-standard-16" \
--image-type "Ubuntu" \
publichaascluster

#  gcloud container clusters --zone=us-central1-b delete  haas
#--region=us-central1 
