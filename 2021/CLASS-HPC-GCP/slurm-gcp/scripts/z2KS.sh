#!/bin/sh
#
# 
#
# This is a test script to see if we can avoid using a web browser and deploy
# entirely from the command line. 
#
# I suspect it is not very useful, because the time needed between commands varies 
# depending on how quick GCP responds.  I added some sleep commands but sometime
# 30 seconds is not enough. 
#
# I have had great success just running these manually one by one. I though of using
# the && operator in between the commands, but that just made it messy to read.
#
# This script is probably only useful as a tutorial to remind us of the CLI commands.
#
# 
#
#


GCLOUDUSER=""
PROJECT_ID=""
SAUSER=""
ZONE=""
FOLDER_ID=""

gcloud config set account $GCLOUDUSER
gcloud projects create $PROJECT_ID --folder=$FOLDER_ID
sleep 30
gcloud config set project $PROJECT_ID
gcloud services enable compute.googleapis.com iam.googleapis.com kubernetes.googleapis.com file.googleapis.com
gcloud iam service-accounts create $SAUSER --display-name "Tony Terraform"
gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:$SAUSER@$PROJECT_ID.iam.gserviceaccount.com --role='roles/editor'
gcloud projects add-iam-policy-binding $PROJECT_ID --member serviceAccount:$SAUSER@$PROJECT_ID.iam.gserviceaccount.com --role='roles/iam.securityAdmin'
gcloud iam service-accounts keys create $SAUSER-credentials.json --iam-account=$SAUSER@$PROJECT_ID.iam.gserviceaccount.com
echo "$SAUSER-credentials.json" >>.gitignore
echo "local*" >>.gitignore
echo " Initialize Terraform"
make init
sleep 30
echo " Validating Terraform input files "
make validate
sleep 30
echo " Running Terraform plan"
make plan 
sleep 30
echo " Applying Terraform plan"
make apply

#
# 
#  commands to run after the cluster is made.
#
#  gcloud compute instances list
#  gcloud beta compute ssh --zone "$ZONE" "class-login0" --project "$PROJECT_ID"
#  sinfo
#  srun hostname
#  sinfo
#  make destroy
