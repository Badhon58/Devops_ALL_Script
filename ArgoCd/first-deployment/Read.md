### Access Nginx via browser

- Port-forward the NGINX service:
```
kubectl port-forward svc/nginx-service 8081:80 --address=0.0.0.0 &
```

argocd login 13.232.160.155:8080 --username admin --password test123# --insecure

