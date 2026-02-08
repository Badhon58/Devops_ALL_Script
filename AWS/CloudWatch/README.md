### Cloud Watch

- CLoud Watch is used to monitor performance of AWS Resources
- Cloud Watch can monitor all AWS Services
- CloudWatch is all about Alarms, Events and Logs
- Host level Metrics
  - CPU
  - Network
  - Disk
  - Status Checks

## Cloud Watch Log Demo

1. launch amazon linux 2 EC2 instance
2. Create a IAM Role and use CW Permissions
3. Attach the Role to the CS2 instance
4. Login to the EC2 instance and install CW Agent
5. Configure the files
6. Start the CW agent Service
7. See the logs in CW logs

--
```
$ yum install -y awslogs
$ cd /etc/logs
$ ls
$ systemctl start awslogsd
```