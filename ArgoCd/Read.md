## Adding Cluster to ArgoCD server

1. Check your config contexts:

```
kubectl config get-contexts
```

2. Identify your cluster context (e.g., kind-argocd-cluster).Add the cluster to ArgoCD:

```
argocd cluster add kind-argocd-cluster --name argocd-cluster --insecure
```

3. Verify using:

```
argocd cluster list
```

4. Port Forward for ui
```
$ kubectl port-forward svc/argocd-server -n argocd 8080:443 --address=0.0.0.0 &
```
