
gcloud container clusters create "haas" \
  --zone "us-central1-b" \
  --machine-type "n1-standard-32" \
  --scopes "cloud-platform" \
  --image-type "GCI" \
  --num-nodes "3"  --enable-autoscaling --min-nodes "1" --max-nodes "200" 
