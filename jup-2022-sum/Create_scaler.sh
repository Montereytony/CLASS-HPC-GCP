#Note that the node pool is tainted. Only user pods that are configured with a toleration for this taint can schedule on the node pool’s nodes. This is done in order to ensure the autoscaler will be able to scale down when the user pods have stopped.
#
gcloud container node-pools create \
--machine-type n1-highmem-8 \
--num-nodes 2 \
--enable-autoscaling \
--min-nodes 1 --max-nodes 20 \
--node-labels hub.jupyter.org/pool-name=<pool-name>-pool \
--node-taints hub.jupyter.org_dedicated=user:NoSchedule \
--region=us-central1 \
--image-type=ubuntu \
--disk-size=200 --disk-type=pd-ssd \
--no-enable-autoupgrade \
--tags=hub-cluster \
--cluster=fall-2019 \
user-pool-<pool-name>-<yyyy>-<mm>-<dd>
