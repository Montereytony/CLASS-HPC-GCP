#!/bin/sh

gcloud config set project haas-jupyter-jub
gcloud config set compute/zone  us-central1-b

# Create a network
# First, create a network for your cluster. The following command creates a network, my-net-0:

gcloud compute networks create my-net-0  --subnet-mode custom

# Next, create a subnet, my-subnet-2, in the my-net-0 network, 
# with secondary ranges my-pods-2 for Pods and my-services-2 for Services:


gcloud compute networks subnets create my-subnet-2 \
    --network my-net-0\
    --region us-central1 \
    --range 192.168.0.0/20 \
    --secondary-range my-pods-2=10.4.0.0/14,my-services-2=10.0.32.0/20 \
    --enable-private-ip-google-access

# Create a private cluster
# Now, create a private cluster, private-cluster-1, 
# using the network, subnet, and secondary ranges you created.


gcloud container clusters create private-cluster-1 \
    --zone us-central1-b \
    --enable-master-authorized-networks \
    --network my-net-0 \
    --subnetwork my-subnet-2 \
    --cluster-secondary-range-name my-pods-2 \
    --services-secondary-range-name my-services-2 \
    --enable-private-nodes \
    --enable-ip-alias \
    --master-ipv4-cidr 172.16.0.16/28 \
    --no-enable-basic-auth \
    --no-issue-client-certificate



# gcloud compute firewall-rules create <FIREWALL_NAME> --network my-net-0 --allow tcp,udp,icmp --source-ranges <IP_RANGE>
# gcloud compute firewall-rules create <FIREWALL_NAME> --network my-net-0 --allow tcp:22,tcp:3389,icmp


