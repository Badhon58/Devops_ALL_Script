# EKS Storage

**_Type of EKS Storage_**

- In Tree EBS Provisioner

  - Legacy, Will be deprecated soon

- EBS CSI Driver
- EFS CSI Driver
- FSx for Luster CSI
  - CSI Means Container Storage Interface
  - Allows EKS Clusters to manage lifecycle of EBS Volumes for persistent storage, EFS file systems & ESx for Luster File systems

**_AWS Elastic Block Store - Introduction _**

- EBS provides block level storage volumes for use with EC2 & Container instances
- EBS provides block level storage volumes for use with EC2 & Container instances.
- We can mount these volumes as devices on our EC2 & Container instances.
- EBS volumes that are attached

---

### EKS Storage EBS CSI Driver

**_Introductions_**

- EBS provides block level storage volumes for use with EC2 & Container instances.
- We can mount these volumes as devices on our EC2 & Container instances.
- EBS volumes that are attached to an instance are exposed as storage volumes that persiste
  independent from the life of the EC2 or Container instance.
- We can dynamically change the configuration of a volume attached to an instance.
- AWS recommends EBS for data that must be quickly accessible and requires long-term persistence.
- EBS is well suited to both database-style applications that rely on random reads and writes, and to throughput-insensive applications that perform long, continuous reads and writes.

**_We need to learn_**

- Storage Class
- Persistent Volume Clain
- Config Map
- Environment Variables
- Volumes
- Volume Mounts
