### Lunch 2 server with this user data and the lunch SG just 22 port open

```
yum update -y
yum install -y httpd
systemctl start httpd
systemctl enable httpd
echo "<h1> Hello world from $(hostname -f) </h1>" > /var/www/html/index.html

```

then create a SG after that create a load balance
after that this sg will be just open for port 80 and the custom sg just the lb

---

## ALB

- A Launch Template (older "Launch Configurations" are deprecated)
  - AMI + Instance Type
  - EC2 User Data
  - EBS Volumes
  - Security Groups
  - SSH Key Pair
  - IAM Roles for your EC2 Instances
  - Network + Subnets Information
  - Load Balancer information
- Min Size / Max Size / Initial Capacity
- Scaling Policies
