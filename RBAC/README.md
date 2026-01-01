## API objects for configuring RBAC: Role, ClusterRole, RoleBinding and ClusterRoleBinding

### Role:

- Role defines what can be done to kubernetes Resources.
- Role contains one or more rule that represent a set of permissions.
- ROles are namespaced, meaning roles work within the constraints of a namespace. it would default to the default namepsace if none was specified.
- After creating a ROle, you assign it to a user or group of users by creating a RoleBinding

* EX: Here's an example Role in the default namespace that can be used to grant read access to pods:

```
kind: Role
apiVersion: rbac.authorization.k8s.io/v1
metadata:
	namespace: default
	name: pod-reader
rules:
	- apiGroup: [""]
	  resources: ["pods","services","deployments"]
	  verbs: ["get", "watch", "list"]
```

- In the rules above we:

1. apiGroup: [""] - set core API group
2. resources :["pods"] - which resources are allowed for access
3. ["get","watch","list"]- which actions are allowed over the resources above

---

## RoleBinding

- Role Binding is used for granting permission to a Subject
- RoleBinding holds a list of subjects (users, group, or service accounts), nd a reference to the role being granted.
- Role and RoleBinding are used in namespaced scoped.
- RoleBinding may reference any role in the same namespace.
- After you create a binding, you cannot change the Role that it refers to. If you do want to change the roleRef for a binding, you need to remove the binding object and create a again

### Example :

- Here is an example of a RoleBinding that grants the "pod-reader" Role to the user "michale" within the "default" namespace. This allows "michale" to read pods in the "default"

### Code:

```
kind: RoleBinding
apiVersion: rbac.authorization.k8s.io/v1
metadata:
	name: read-pods
	namespace: default
subjects:
	- kind: User
	  name: Bahdhon
	  apiGroup: rbac.authorization.k8s.io
roleRef:
	kind: Role
	name: pod-reader
	apiGroup: rbac.authorization.k8s.io
```

### Here we set:

- subjects: <!-- Which user will acces it  -->
  - kind: User - an object type which will have access, in our case this is a regular user.
  - name: example-user -an users name to set the permissions
  - apiGroup: rbac.authorization.k8s.io
- roleRef: <!-- Which Role will acces to the role  -->
  - kind: Role - What exactly will be attached to the user, in this case the Role object type
  - name: pod-reader the role name as it was set in the name: pod-reader in the example above
  - apiGroup: rbac.authorization.k8s.io

---

## ClusterRole

- ClusterRole works the same as Role, But they are applied to the cluster as a whole
- ClusterRoles are not bound to a specific namespace. ClusterRole give access more than one namespace or all namespaces
- After creating a ClusterRole, you assign it to a user or group of the users by creating a ClusterRoleBinding.
- ClusterRoles are cluster-scoped, you can use ClusterRoles to control access to different kinds of resources than you can with Roles.
- Cluster-scoped resources (e.g. Nodes, persistentVolumes)

### Example

```
kind: ClusterRole
apiVersion: rbac.authorization.k8s.io/v1
metadata:
  name: jenkins-cluster-role
rules:
  - apiGroup: ["*"]
    resources: ["*"]
    verbs: ["*"]
```

---

## ClusterRoleBinding

- ClusterRole and ClusterRoleBinding function like Role and RoleBinding, except they have wider scope
- RoleBinding grants permissions within a specific namespace, whereas a ClusterRoleBinding grants access cluster-wide and to multiple namespaces.
- ClusterRoleBinding is binding or accociating a ClusterRole with a Subject (users, groups, or service accounts)

### Example:

```
kind: ClusterRoleBinding
apiVersion: rbac.authorixation.k8s.io/v1
metadata:
	name: jenkins-cluster-role-binding
subjects:
	- kind: User
	  name: Badhon
	  apiGroup: rbac.authorixation.k8s.io
roleRef:
	kind: ClusterRole
	name: jenkins-cluster-role
	apiGroup: rbac.authorixation.k8s.io
```

---

A ClusterRole looks similar to a Role with the only difference that we have to set its kind as ClusterRole

The difference is that Role is used inside of a namespace, ehile ClusterRole is luster-wide permission without a namespace boundaries, for example:

- allow access to a clusternodes
- resources in all namespaces
- allow access to endpoints like /healthz
  RBAC in kubernetes is based on three key concepts:

1. Verbs: This is a set of operations that can be executed on resources. there are many verbs, but they's all Create, Read, Upodate, or Delete (also known as CRUD)
2. API Resources the set of kubernetes API Objects available in the cluster are called Resources. for exmaple:
   Pods, Deployments, Services, Nodes, PersistentVolumes etc.
3. Subjects: THese are the objects (Users, Groups, preocesses (Service Account) allowed access to the API, based on verbs and Resources
