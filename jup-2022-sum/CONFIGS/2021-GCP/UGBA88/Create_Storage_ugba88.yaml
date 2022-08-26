# persistent volume
apiVersion: v1
kind: PersistentVolume
metadata:
  name: ugba88-pv
  namespace: ugba88
spec:
  capacity:
    storage: 40Gi
  accessModes:
    - ReadWriteMany
  nfs:
    server: 10.128.0.10
    path: "/home/ugba88"
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: ugba88-pvc
  namespace: ugba88
spec:
  storageClassName: ""
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 20Gi
