### Access Nginx via browser

- Port-forward the NGINX service:
```
kubectl port-forward svc/nginx-service 8081:80 --address=0.0.0.0 &
```