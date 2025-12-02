## Resource Management in Kubernetes

```
resources:
    request:
        memory: "200Mi"
        cpu: "1"
    limit:
        memory: "2Gi"
        cpu: "1"

```

**_Deployment_**


```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: pod-resources
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx
  templete:
    metadata:
      labels:
        name: nginx-pod
    spec:
      container:
        - name: nginx
          image: nginx
          ports:
            - containerPort: 80
          resources:
            request:
              memory: "200Mi"
              cpu: "1"
            limit:
              memory: "2Gi"
              cpu: "1"
          # env:
          #   - name: hello
          #     value: "hello"
        
```

$ Kubectl top pods

QOS => Quality of Services 

limitRange 