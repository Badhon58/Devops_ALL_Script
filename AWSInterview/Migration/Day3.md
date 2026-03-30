# Day 03:

- We will deploy the infra which includes a WP app, NodeJs, MySQL and MariaDB.
- We will migrate them to VM to VM today

Phases:

- 1. Assess(Discovery)
- 2. Mobilize
- 3. Migrate
- 4. Optimize/Modernize. (Optional)

* AWS DMS = AWS DataBase Migration System

# CloudFormation:

- IaaC : Infrastructure as a Code
  - Faster
  - Reusable
  - Idempotent - Skip the task that is already created
  - Rollback/retain successful resources.

* **_Cloud provisioning_** : is the process of setting up, allocating, and managing cloud computing resources—such as virtual machines, storage, networking, and applications—for user or organization access

### jump box server

- A jump box server (also called a bastion host) is a secure intermediary server that you use to access other servers inside a private network.

- What is a Jump Box Server?
  - A jump box is a server that:
    - Sits between the public internet and your private servers
    - Acts as a controlled entry point
    - Lets you SSH into one server first, then “jump” to others

---

### ADS = Application Discovery Services

- Collects configuration, usage and behavioral data from on-premise servers and helps to plan the migration to AWS Cloud

Application Discovery Process

- **_Discovery for Migration Planning_** : Detailed information about performance, specification and running processes are collected to preform cost estimation of migration application to AWS
- **_Integration with Migration Hub_** : In order to talk the status of migrations across your application portfolio, the Application Discovery Service is integrated with Migration Hub.
- **_Encryption of Data_** : The Data Collected is encrypted within the Application Discovery service data store.
- **_Engaging with Experts_** : The Experts are trained to analyst the output of Application Discovery Service to gain further insight and recommend appropriate migration strategies

---

- AWS Discovery link
  - https://docs.aws.amazon.com/application-discovery/latest/userguide/what-is-appdiscovery.html
- Installing the AWS Replication Agent on Linux servers
  - https://docs.aws.amazon.com/mgn/latest/ug/linux-agent.html
- Installing the AWS Replication Agent on Windows Server
  - https://docs.aws.amazon.com/mgn/latest/ug/windows-agent.html

---

### AWS Discovery Agent install

-> **_Link:_** https://docs.aws.amazon.com/application-discovery/latest/userguide/install.html

- 1. Sign in to your Linux-based server or VM and create a new directory to contain your agent components.

- 2. To install AWS Application Discovery Agent in your data center
  - curl -o ./aws-discovery-agent.tar.gz https://s3.(region).amazonaws.com/aws-discovery-agent.(region)/linux/latest/aws-discovery-agent.tar.gz

- 3. Verify the cryptographic signature of the installation package with the following three commands:
  - curl -o ./agent.sig https://s3.region.amazonaws.com/aws-discovery-agent.region/linux/latest/aws-discovery-agent.tar.gz.sig
  - curl -o ./discovery.gpg https://s3.region.amazonaws.com/aws-discovery-agent.region/linux/latest/discovery.gpg
  - gpg --no-default-keyring --keyring ./discovery.gpg --verify agent.sig aws-discovery-agent.tar.gz

- 4. Extract from the tarball as shown following.
  - tar -xzf aws-discovery-agent.tar.gz

- 5. To install the agent, choose one of the following installation methods.
  - linux:
    - sudo bash install -r (your-home-region) -k (aws-access-key-id) -s (aws-secret-access-key)
  - Windows :
    - Install This .exe file
      - https://s3.us-west-2.amazonaws.com/aws-discovery-agent.us-west-2/windows/latest/AWSDiscoveryAgentInstaller.exe
        - .\AWSDiscoveryAgentInstaller.exe REGION="your-home-region" KEY_ID="aws-access-key-id" KEY_SECRET="aws-secret-access-key" /quiet

---

### Application Discovery Service

### Athena

### Application migration service (MGN)

-> link : https://docs.aws.amazon.com/mgn/latest/ug/linux-agent.html

- This table contains the installer download link by supported AWS Region:
  - sudo wget -O ./aws-replication-installer-init https://aws-application-migration-service-us-east-2.s3.us-east-2.amazonaws.com/latest/linux/aws-replication-installer-init
  - sudo chmod +x aws-replication-installer-init; sudo ./aws-replication-installer-init --region regionname --aws-access-key-id AKIAIOSFODNN7EXAMPLE --aws-secret-access-key wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
