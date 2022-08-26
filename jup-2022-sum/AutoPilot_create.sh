
gcloud beta container --project "haas-jupyter-jub" clusters create-auto "autopilot-cluster-1" --region "us-central1" --release-channel "regular" --network "projects/haas-jupyter-jub/global/networks/default" --subnetwork "projects/haas-jupyter-jub/regions/us-central1/subnetworks/default" --cluster-ipv4-cidr "/17" --services-ipv4-cidr "/22"
