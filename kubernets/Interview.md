## Kubernetes Interview Question

- **What is Kubernetes, and why is it used ?**
  Kubernetes is an open-source container orchestration platform that automates deploy, scaling, and managing containerized applications.

- **What are Pods is Kubernetes?**
  A Pod is the smallest deployable unit in kubernetes. It can contain one or more containers that share storage, network, and specifications for how the containers should run.

- **What is Kubernetes Node?**
  A Kubernetes cluster consists of Nodes. A Node is a physical or virtual machine that runs containerized applications. Each Node has components like the Kubelet, a container runtime (like Docker), and a network proxy .

- **What is a Deployment is Kubernetes?**
  A Deployment is a kubernetes resource that manage the lifecycle of Pods. It allows you to define the desired state of your application, ensuring high availability and easy rollback .

- **How does Kubernetes perform load balancing?**
  Kubernetes provides internal load balancing using Services. A service assigns a stable IP to a group and distributes traffic among them.

- **A Pod keeps crashing. How do you troubleshoot?**
  kubectl logs <pod-name> : It show us the log of that pod
  kubectl describe pod <pod-name>
  check resources limites
  kubectl get pod <pod-name> -o wide

- **What is ConfigMap in Kubernetes ?**
  A ConfigMap is an API object that allows you to store configuration data separately from container images, making applications more flexible.

- **A Service is not reaching the correct Pods. How do you debug?**
  kubectl get pods -o wide
  kubectl get service <service-name>
  kubectl describe service <service-name>

- **What is the purpose of Namespaces in kubernetes?**
  Namespaces allow multiple teams or applications to use the same cluster without conflict. They logically separate resources.

- **How do you scale a Kubernetes Deployment?**
  kubectl scale deployment <deployment-name> --replicas=5

- **What is a statefulSet in Kubernetes?**
  A Stateful Set is a kubernetes controller used to manage stateful applications. It ensures that each Pod has a unique, stable identity, persistent storage, and maintains the correct order of deployment and scaling.

- **How does kubernetes handle rolling updates and rollbacks?**
  kubernetes ensures seamless application updates using rolling updates, where new versions of an application are deployed gradually, minimizing downtime. If an update fails, kubernetes allows you to rollback to a previous stable version.
  - kubectl rollout undo deployment/appV1-deployment
  - kubectl rollout history deployment/appV1-deployment
  - kubectl rollout undo deployment/appV1-deployment--to-revision=2

- **A Pod is stack is 'Pending' state. how do you debug?**
  A Pod remains is the 'Pending' state when Kubernetes is unable to schedule it onto a Node. This can happen dua to resource constraints, scheduling issues, or storage problems.

- Check node capacity (kubectl describe node <node-name>)
- Check stroage constraints (kubectl get pvc)
- View Pod events (kubectl describe pod <po-name>)
- Check Scheduler logs (kubectl logs -n kube-system kube-scheduler-<node-name>)
- Ensure images pull correctly (kubectl describe pod | grep "ImagePullbackOff")
- Verify scheduling constraints (nodeSelector, affinity, trints & tolerations)
- Check network Policies (kubectl get networkpolicy -A)

- **What is a Persistent Volume (PV) and Persistent Volume Claim (PVC)**
  Kubernetes Pods are ephemeral, meaning data stored inside a Pod is lost when the Pod is deleted or restarted. To store data persistently, kubernetes provides Persistent VOlumes (PVs) and Persistent Volume Claim (PVCs)
  - **Persistent Volume** : A piece of storage in the cluster that has been provisioned by an administrator or dynamically provisioned using Storage Classes.
  - **Persistent Volume Claim** : A request for storage by a user or an application.

- **How do you set up autoscaling in kubernetes?**
  - $ kubectl autoscale deployment <deployment-name> --cpu-percent=50 --min=2 --max=5
    - Horizontal : Increase The Number of Pods
    - Vertical : Increase The size/resources of Pod

- **What is a network Policy in Kubernetes?**
  A Network Policy in kubernetes controls how Pods communicate with other and with network resources it defines ingress(incoming) and egress(outgoing) traffic rules between Pods .

- **How do you expose a kubernetes application externally?**
  - By default, kubernetes Pods are isolated and can't be assessed from outside the cluster. To expose applications externally kubernetes provides multiple options depending on your requirements.

- **Method** :
  - _Loadbalancer Service_ : Expose apps directly with a cloud-managed external IP.
  - _NodePort Service_ : Assigns a port on each node for external access.
  - _Ingress Controller_ : Handles domain-based routing with HTTPS support.
  - _External DNS / Service Mesh_ : Advanced routing, service discovery and security.
