### How to Create VPC in AWS: 5 Step

1. Create VPC : Setup secure cloud network
2. IP Address: IP block for network partition
3. Subnet: Partitioned VPC Ip segment
4. Internet Gateway: Bridge VPC to the internet
5. Route Table(Root Table Entry): Directs VPC traffic flow

- if we create a subnet instate on having 126 ip we get 123
- firstIp (192.168.0.1) = is a gateway Ip
- SecondIp (192.168.0.2) = is for DNS
- Third Ip (192.168.0.3) = is for reserve Ip for advance research

4. Internet Gateway will attach with the VPC
5. Route Table will also attach with the VPC

- from my location to private subnet access
  - copy file from windows to linux
  - scp -i key.pem key.pem ec2-user@ip:/home/ec2-user

- Using Private key we can access private ec2instance
  $ ssh -i key.pem ec2-user@private-ip

---

- 2. task access private ec2 using Endpoint and basion host

---

- NAT Gateway -> Network Address Translator
- first create a NAT gateway then add this nat gateway to the root route table

- create A Nat Gateway -> Assign to this ip in private route Table then you can access it

---

# Recap

- **_VPC_**
  - _Definition_
    - A Virtual Private cloud (VPC) is a virtual network dedicated to your AWS account within the AWS cloud
    - It provides a logically isolated environment for you AWS resources
  - _Configuration_
    - VPC are created with a specified range of IP addresses using CIDR block notation
    - AWS supports IPv4 CIDR blocks between /16 and /28 netmask
    - You Can Add Up to 5 CIDR Rang Within Single VPC
  - _Maximum VPCs per Region_
    - Default limit is 5 per region, but this can be increased upon request.
- **_Subnets_**
  - _Definition_
    - A Subnet is a segmented portion of a VPC's Ip address range, allowing for organized allocation of IP addresses.
  - _Configuration_
    - Subnets are created within Availability Zones(AZs)
  - _Subnets per VPC_
    - Default limit is 200

- **_Public Subnet_**
  - _Definition_
    - Subnet that's accessible from the internet
  - _Usage_
    - Typically for web servers and load balancers
  - _Point to Consider_
    - Requires an Internet Gateway for Internet access

- **_Private Subnet_**
  - _Definition_
    - Subnet not accessible from the internet
  - _Usage_:
    - Ideal for sensitive applications like databases
  - _Point To Consider_
    - Requires a NAT Gateway for outbound internet access

- **_Internet Gateway_**
  - _Role_
    - Connects AWS VPC to the internet
  - _Configuration_
    - Attached to VPC and routes traffic to/from the internet
  - _Point To Consider_
    - Public Ip is Necessary for resources in the public subnet to communicate with the internet
- **_NAT Gateway_**
  - _Role_
    - Enables instances in a private subnet to access the internet for updates and downloads
  - _Configuration_
    - Placed in a public with an Elastic IP address
  - _Point To Consider_ - No inbound internet traffic allowed to private subnet through NAT.
  - Each NAT Gateway supports up to 50,000 simultaneous connections
  - _Bandwidth_
    - Up to 45 Gbps, depending on the instance type

- **_Route Tables:_**
  - _Role_ : Controls where network traffic is directed
  - _Configuration_:
    - Main Route Table : Automatically created, manages default routing for all subnet
    - Custom Route Tables : Created manually for specific routing needs
  - _Point To Consider_ :
    - Define rules to determine network traffic direction
  - Route Tables per VPC : Default limit is 200
  - Routes per Route Table : 50
