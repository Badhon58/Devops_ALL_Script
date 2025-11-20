Deployment Resource is the most commonly used approach
It internally uses another Resource i.e., ReplicaSet
Same like other resources, it supports scale up and scale down of our pods
it supports Rolling updates and Rollbacks
We can deploy the latest developed code without any server downtime

Deployment Strategies
------------------------
We have 3 different strategies:

1) Re-Create (In this strategy server downtime will be there)
2) Rolling update (Default)
3) Canary

Re-Create: Means it will delete all the existing pods and it will create new pods.
Rolling Updates: More suitable for general updates and enhancements, especially when it is a minimal distruption.Then we can use this strategy.
Canary: It ideal for high-risk updates or major feature releases
--------------------
Blue Green Deployment
--------------------
It is one of the mostly used application release model