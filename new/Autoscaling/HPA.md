- d = ceil[a* (c/t)]
- d is the desired number of replicas
- a is the current or actual number of replicas
- c is the current value of the metric
- t is the target value
- d = ceil [2 * (90/70)] = ceil [2* 1.28] =ceil[2.57] =3 replicas

## Kubectl get hpa

### HPA For Deployment

**_Create A Deployment_**

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: utility-api
spec:
  replicas: 2
  selector:
    matchLabels:
      app: utility-api
  templete:
    metadata:
      name: utility-api-pod
      labels:
        app: utility-api
    spec:
      containers:
        - name: utility-api
          image: pavanelthepu/utility-api
          ports:
            - containerPort: 8080
          resources:
            request:
              memory: "20Mi"
              cpu: "0.25"
            limits:
              memory: "20Mi"
              cpu: "1"

```

---

**_Create A Services_**

```
apiVersion: v1
kind: Service
metadata:
  name: utiles-api-server
spec:
  selector:
    app: utility-api
    ports:
      - port: 8080
        targetPort: 8080

```

---

**_Create A HPA_**

```
apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: utility-api
spec:
  minReplicas: 1
  maxReplicas: 5
  metrics:
    - resource:
        name: cpu
        target:
          averageUtilization: 70
          type: Utilization
      type: Resource
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: utility-api

```

- Kubectl get hpa
- kubectl top pods
