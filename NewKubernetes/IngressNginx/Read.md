### Ingress Rules/ Resources

- Ingress exposes HTTP and HTTPS routes outside the cluster to services withn in the cluster
- Traffic routing is controlled by rules defined in the Ingresss resource
- Ingress resources cann't do anything on their own. We need to have an Ingress controller in order for the Ingress resources to work. THus, Ingress controller implements rules defined by ingress resources

### path based Routing

- In path based routing, no host is specified, so the rule applies to all inbound HTTP trafic through the ingress controller
- Every path is associated with a backend serrvice of clusterIp type and a port on which the service listens on

