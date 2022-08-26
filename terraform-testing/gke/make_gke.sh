export cluster_name=2022-Fall
export cluster_zone=us-central1-b

gcloud container clusters create $cluster_name \
    --machine-type=n1-standard-2 \
    --num-nodes 3 \
    --enable-autoscaling --min-nodes 0 --max-nodes 6 \
    --zone $cluster_zone
