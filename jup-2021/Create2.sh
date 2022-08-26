gcloud config set project haas-jupyter-jub
gcloud config set compute/zone  us-central1-b
gcloud compute networks create custom-network1  --subnet-mode custom
gcloud compute networks subnets create subnet-us-central1-b \
   --network custom-network1 \
   --region us-central1 \
   --range 192.168.1.0/24

#gcloud compute firewall-rules create allow-ssh \
#    --network custom-network1 \
#    --source-ranges 35.235.240.0/20, \
#    --allow tcp:22
gcloud compute firewall-rules create allow-ssh-network1 --network custom-network1 --allow tcp:22,tcp:3389,icmp

gcloud container clusters create "haascluster" \
    --zone "us-central1-b" \
    --username "admin" \
    --cluster-version "latest" \
    --machine-type "n1-highmem-8" \
    --image-type "ubuntu" \
    --disk-type "pd-standard" \
    --disk-size "100" \
    --num-nodes "3" \
    --max-nodes=50 --min-nodes=1 \
    --enable-private-nodes \
    --enable-private-endpoint \
    --master-ipv4-cidr "172.16.0.0/28" \
    --enable-ip-alias \
    --network "projects/haas-jupyter-jub/global/networks/custom-network1" \
    --subnetwork "projects/haas-jupyter-jub/regions/us-central1/subnetworks/subnet-us-central1-b"\
    --max-nodes-per-pool "110" \
    --enable-master-authorized-networks \
    --enable-autoupgrade \
    --enable-autorepair

