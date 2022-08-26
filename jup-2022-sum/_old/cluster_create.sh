 gcloud container clusters create "haas" \\n  --zone "us-central1-b" \\n  --machine-type "n1-standard-16" \\n  --scopes "cloud-platform" \\n  --num-nodes "3"  --enable-autoscaling --min-nodes "1" --max-nodes "25"

kubectl cluster-info\n


Kubernetes master is running at https://35.192.92.232
GLBCDefaultBackend is running at https://35.192.92.232/api/v1/namespaces/kube-system/services/default-http-backend:http/proxy
KubeDNS is running at https://35.192.92.232/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
Metrics-server is running at https://35.192.92.232/api/v1/namespaces/kube-system/services/https:metrics-server:/proxy

