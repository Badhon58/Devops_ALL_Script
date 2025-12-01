**_Empty Dir _**

- kubectl port-forward svc/mongo-svc 32000:27017
- kubectl exec -it mongopo -- /bin/bash
- ps aux
- kill 1
- We Restart the container not the pod
- To Check the Pod yaml file content
  - kubectl get po mongo-pod-id -o yaml

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo
  template:
    metadata:
      labels:
        app: mongo
    spec:
      container:
        - image: mongo
          name: mongo
          args: ["--dbpath", "/data/db"]
          env:
            - name: MONGO_INITDB_ROOT_USERNAME
              value: "admin"
            - name: MONGO_INITDB_ROOT_PASSWORD
              value: "password"
          ports:
            - containerPort: 27017
          volumesMounts:
            - mountPath: /data/db
              name: mongo-volume
      volumes:
        - name: mongo-volume
          emptyDir: {}

```

**_Host Path Volume _**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo
  template:
    metadata:
      labels:
        app: mongo
    spec:
      container:
        - image: mongo
          name: mongo
          args: ["--dbpath", "/data/db"]
          env:
            - name: MONGO_INITDB_ROOT_USERNAME
              value: "admin"
            - name: MONGO_INITDB_ROOT_PASSWORD
              value: "password"
          ports:
            - containerPort: 27017
          volumesMounts:
            - mountPath: /data/db
              name: mongo-volume
      volumes:
        - name: mongo-volume
          # emptyDir: {}
          hostPath:
            path: /data

```

---

## Persistence

**_ Persistence Volume _**

Type of Persistence Volume

- Persistent Volume
- Persistence Volume Claim
- Storage Classes

- Persistent Volume : Persistent Volume is a Kubernetes resources and can be created using yaml.It is an abstract component and it must take storage from the actual physical storage like aws ebs on nfc server
- $kubectl api-resources | grep persistent
- $kubectl get pvc
- $kubectl get pv
- Ctrl+r

```
apiVersion: v1
kind: PersistentVolume
metadata:
  name: mongo-pv
spec:
  capacity:
    storage: 5Gi
  accessModes:
    - ReadWriteMany
    # - ReadWriteOnce
    # - ReadOnlyOnce
    # - ReadOnlyMany
    # - ReadWriteOncePod
  local:
    path: /storage/data
  nodeAffinity:
    required:
      nodeSelectorTerms:
      - matchExpressions:
        - key: kubernetes.io/hostname
          operator: In
          values:
          - example-node
```

**_PersistentVolume Claim_**

```
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: mongo-pvc
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 5Gi
  storageClassName: "demo-storage"

```

**_Development_**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: mongo
spec:
  replicas: 1
  selector:
    matchLabels:
      app: mongo
  template:
    metadata:
      labels:
        app: mongo
    spec:
      container:
        - image: mongo
          name: mongo
          args: ["--dbpath", "/data/db"]
          env:
            - name: MONGO_INITDB_ROOT_USERNAME
              value: "admin"
            - name: MONGO_INITDB_ROOT_PASSWORD
              value: "password"
          ports:
            - containerPort: 27017
          volumesMounts:
            - mountPath: /data/db
              name: mongo-volume
      volumes:
        - name: mongo-volume
          # emptyDir: {}
          # hostPath:
          #   path: /data
          persistentVolumeClaim:
            claimName: mongo-pvc
```

**_Services _**

```
apiVersion: v1
kind: Service
metadata:
  name: mongo-svc
spec:
  type: NodePort
  selector:
    app: mongo
  ports:
    - port: 27017
      nodePort: 32000
      targetPort: 27017
      protocol: TCP
```

- kubectl port-forward svc/mongo-svc 32000:27017

## Storage Class

- When we Create a Storage Class we are actually create a dynamic storage for persistenceVolumeClaim. When we claim the require storage the storage class will autometically create the PersistenceVolume For Us.

```
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: demo-storage
provisioner: k8s.io/minikube-hostpath
volumeBindingMode: Immediate
# Immediate | WaitForFirstConsumer
reclaimPolicy: Delete

```

kubectl get sc
