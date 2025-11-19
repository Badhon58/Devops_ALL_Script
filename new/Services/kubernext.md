kubernetes Namespace

Namespaces are used to group the resources belonging to different projects

We can create multiple namespaces for multiple projects
ex: clinicall-ns

-n => Represent namespace

To display the existing namespaces
$kubectl get ns


#To view the resource of specific namespace
$ kubectl get all -n <Namespace Name>
$ kubectl get pods -n <Namespace Name>

# Create a new namespace
$ kubectl create ns <Namespace Name>
$ Kubectl create ns clinicall

# Delete a Namespace, So that all the resource created inside the namespaces will also be deleted along with the namespaces
$ kubectl delete ns fedex-ns

---
apiVersion: v1
kind: Namespace
metadata:
    name: fexed-ns
...

===============================================
Kubernetes provides resources to create Pods to support self-healing

1) ReplicationController
2) ReplicaSet
3) Deployment
4) StatefulSet
5) DaemonSet

================================================
ReplicationController
------------------------------------------------
This services allows us to create Pods and always takes care to run the requested number of pods to be available.

Whenever a Pod is deleted, this services will automatically recreates the Pod. 
Also this services allows us to scale up or down our Pods 