CLIENT_IP=$(gcloud compute instances describe my-client \
    --zone=us-central1-b \
    --format='value(networkInterfaces[0].networkIP)')
