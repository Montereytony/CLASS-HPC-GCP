#Retrieve the Kubernetes credentials for a specific cluster:
gcloud container clusters get-credentials haas  --zone=us-central1-b

kubectl cluster-info

gcp@sixy jup % kubectl cluster-info
Kubernetes master is running at https://35.226.169.46
GLBCDefaultBackend is running at https://35.226.169.46/api/v1/namespaces/kube-system/services/default-http-backend:http/proxy
KubeDNS is running at https://35.226.169.46/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://35.226.169.46/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy
