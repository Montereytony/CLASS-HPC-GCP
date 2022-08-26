export cluster_name=2022-Fall
export cluster_zone=us-central1-b
gcloud container clusters get-credentials $cluster_name --zone $cluster_zone

