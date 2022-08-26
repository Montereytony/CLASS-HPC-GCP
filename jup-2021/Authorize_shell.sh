#35.233.132.111
#35.233.132.111
gcloud container clusters update private-cluster-1 \
    --zone us-central1-b \
    --enable-master-authorized-networks \
    --master-authorized-networks 35.233.132.111/32
gcloud container clusters get-credentials private-cluster-1 \
    --zone us-central1-b \
    --project haas-jupyter-jub
gcloud container clusters get-credentials haascluster --zone us-central1-b --project haas-jupyter-jub
gcloud container clusters get-credentials haaskubecluster --zone us-central1-b --project haas-jupyter-jub
