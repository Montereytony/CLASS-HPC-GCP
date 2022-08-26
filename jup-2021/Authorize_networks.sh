gcloud container clusters create publichaascluster	\
    --enable-master-authorized-networks \
    --master-authorized-networks 0.0.0.0/0
