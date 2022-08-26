
gcloud container clusters create notebook-test \
    --num-nodes=3 \
    --machine-type=n1-highmem-2 \
    --zone=us-central1-b


gcloud beta container node-pools create user-pool \
  --machine-type n1-standard-2 \
  --num-nodes 0 \
  --enable-autoscaling \
  --min-nodes 0 \
  --max-nodes 20 \
  --node-labels hub.jupyter.org/node-purpose=user \
  --node-taints hub.jupyter.org_dedicated=user:NoSchedule \
  --zone=us-central1-b \
  --cluster Haas


gcloud container clusters create haas \
   --machine-type=n1-standard-2 \
   --num-nodes=3 \
   --enable-autoscaling \
   --min-nodes=2 \
   --max-nodes=80 \ 
   --node-labels=hub.jupyter.org/node-purpose=user \
   --node-taints=hub.jupyter.org_dedicated=user:NoSchedule \
   --zone=us-central1-b 





#
# gcloud container clusters delete haas --zone=us-central1-b
#
gcloud container clusters create haas \
  --zone us-central1-b \
  --num-nodes 3 --enable-autoscaling --min-nodes 1 --max-nodes 200 --os












n1-standard-32
