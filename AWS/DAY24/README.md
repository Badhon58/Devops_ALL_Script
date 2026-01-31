# 24th Session AWS - EC2 Security Groups, NACL

## EC2 Security Groups

- Firewall = Which stops unauthorize access to the network
- Firewall = Security Group (Allow/Deny)
- Security Group = SG stop unauthorized access to the EC2 instance
- Security Group is used to Secure the EC2 instance
- SG acts like a firewall to the EC2 instance
- Security Group has 2 types of rules
  - Inbound Rule : Which allows the traffic towards EC2 instance
  - Outbound Rule : Which allows the traffic outside EC2 instance
- By default, Inbound rules are Deny/ Outbound rules are Allowed
- RDP --> is used to login to the windows EC2 instance / 3389
- SSH --> is used to login to the linux EC2 Instance / 22
- http --> is used to access application on ec2 instance on port 80
- https --> is used to access applications on EC2 instance on port 443 securely

## NACL = Network Access Control List

- Another layer of Security to the EC2 instance
- If you want to tight the Security go to NACL
- like SG, NACL also has inbound rule and Outbound rules
- NACL will hit first and then SG
  - Instance meta-data=Data about EC2 instance
    From Console, you get this meta-data from Details Section
    From CLI, Follow this below URL
    http://169.254.169.254/latest/meta-data/
  - User-Data
    User-Data= BootStrap Scription
    THe script which you have provided will run at the boot time of the EC2 instance
    - user-data will run only for the first time of lunching the EC2 instance
      linux=Shell script
      Windows = PowerShell
