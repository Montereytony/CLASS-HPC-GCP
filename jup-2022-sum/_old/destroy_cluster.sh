gcp@sixy jup % gcloud container clusters create notebook-test \
    --num-nodes=3 \
    --machine-type=n1-highmem-2 \
    --zone=us-central1-b

gcloud container clusters --zone=us-central1-b delete  haas
