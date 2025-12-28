### Ingress Rules/ Resources

- Ingress exposes HTTP and HTTPS routes outside the cluster to services withn in the cluster
- Traffic routing is controlled by rules defined in the Ingresss resource
- Ingress resources cann't do anything on their own. We need to have an Ingress controller in order for the Ingress resources to work. THus, Ingress controller implements rules defined by ingress resources

### path based Routing

- In path based routing, no host is specified, so the rule applies to all inbound HTTP trafic through the ingress controller
- Every path is associated with a backend serrvice of clusterIp type and a port on which the service listens on

---

## RBAC

Role based Access Control

- Role
- ClusterRole
- RoleBinding
- ClusterRoleBinding

-> Role

```
rules:
	- apiGroup :[""]
	  resources:["pods","watch","list","create"]
	  verbs: ["get","watch","list","create"]
```

Role.yaml

```

```

---

- 2 Type of RBAC
  -> Role = For a default namespace (Deployment, Services, )
  -> Clusters = For Overall The Cluster

Role is for a single namespace and Clusters is for overall Cluster

- svc-account-1 (Admin)
  - Complete Permissions
    - Delete, Update, Deploy, All Other Actions
- svc-account-2 (General)
  - Read Only Permissions
    - View Deployments, View Services, View Pods, View ConfigMaps, View Secrtes
- svc-account-3 (OTHERs)
  - NameSpace View Only
    - View NameSpaces



---

# Need to leearn daemonsets statefulsets job cronjobs

---
