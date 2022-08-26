gcloud config set project haas-jupyter-jub
gcloud config set compute/zone us-central1-b
#gcloud compute instances create haas-mysql

gcloud beta sql instances create haas-mysql-1 --region=us-central1 --tier=db-f1-micro\
 --authorized-networks=`curl -s ifconfig.co` --backup-start-time=01:00 --enable-bin-log \
 --activation-policy=ALWAYS --storage-type=HDD --storage-size=30GB
