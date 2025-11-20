ReplicaSet is same as ReplicationController Resource.
Difference is, with the keykord "Selector"

ex: 
In ReplicationController:
selector:
	app:shoping-site
In ReplicaSet:
Ex:
selector:
   matchLabels:
	app: shoping-site
	env:dev
	version:2	