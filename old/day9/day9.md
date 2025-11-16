- Kubernetes Services Explained - ClusterIP vs NodePort vs Loadbalancer vs External

the services in kubernets
1. cluster IP
2. NodePort
3. external names
4. load balancer

1. Node Port => The range of the node port from 30000 to 32767
   Node Port is a services which the application will expose on a particular port the port 
   range is 30000 to 32767
2. So in kubernets Cluster in cluster ip Services there are 2 port one is target port which not open for enterly to the out side world it is in the same cluster. secound port is node port which is accesible to the outsode the world.
3. So in target port the other services can acces the port that are running in the same cluster



<!-- Commnuncate between 2 different pod -->

Now try to established communication between two different Pods within same network or same node 
Pod to Pod Communication on same worker node happens through Pod Ip
By default Pod's Ip will not be accessible Outside the node
after running 2 yaml file check with curl ip:80


<!-- Object Services  -->

Each pod gets its own Ip address, however is a deployment, the set of pods running in one moment
in time could be different from the set of pods running that application a moment later

This leads to a problem: if some set of pods (call them backend) provide functionality to other pod
('call them backends) inside your cluster, how do the frontend find out and keep track of which ip address to connect to , do that the frontend can use the backend part of the workload