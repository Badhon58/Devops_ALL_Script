- Single sign One
  curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-4
  $ eksctl create cluster --name argocd-cluster --region ap-south-1 --without-nodegroup

### Delete Cluster

```
$ eksctl delete cluster --name argocd-cluster --region ap-south-1

```

---

### Create EKS Cluster

```
eksctl create cluster --name argocd-cluster --region eu-west-1 --without-nodegroup

```

### Verify Cluster Creation

```
eksctl get clusters --region eu-west-1
```

### Associate IAM OIDC Provider

```
eksctl utils associate-iam-oidc-provider --region=eu-west-1 --cluster=argocd-cluster --approve
```

### Create Node Group

```
eksctl create nodegroup \
--cluster=argocd-cluster \
--region=eu-west-1 \
--name=argocd-ng \
--node-type=t3.medium \
--nodes=2 \
--nodes-min=1 \
--nodes-max=3 \
--node-volume-size=20 \
--managed
```

### Verify Cluster Access

```
aws eks update-kubeconfig --region eu-west-1 --name argocd-cluster
```

### kubectl get nodes

```
kubectl get nodes
```

### Install ArgoCD