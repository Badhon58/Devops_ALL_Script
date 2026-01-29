## 21st Session AWS - EC2 Volumes, EBS Volumes, Instance Store Volume, EBS Central Storage.

### Volumes are 2 type

- **_EBS Volumes_**
  - Persistent Storage
  - Permanent Storage
  - If you STOP and START the EC2 instance DATA is NOT LOST
  - MAX Sized is 16 TB
  - EBS is Billable
  - Types of EBS Volumes
    - General Purpose (gp2, gp3) -SSD = General Purpose
    - Provisioned IOPS (io1, io2) - SDD = High Performance
    - Throughput(st1) - HDD = Frequently access data with cheaper price
    - COLD(sc1) - HDD = Not Frequently access data with cheaper price
    - Magnetic (Standard) - HDD = Previous Generation
    - (IOPS) = Input OutPut Per Second
    - gp2,gp3,io1,io2,st1,sc1,standard.
    - gp2 is the default EBS volume type, IOPS = Input Output Per Second
    - io1, io2 and grp3 are IOPS configurable = you can input IOPS values
    - THe more IOPS you give, the more you get thr bill
    - gp2 has default IOPS = 1:3=1GB:3 IOPS -> it is not IOPS Configurable
    - Root Volume supports (gp2,gp3,io1,io2 and standard) [expect st1 and st2]
    - Root volume supports (gp2,gp3,io1,io2 and standard) [expect st1 and st2]
    - Root Volume doesn't support st1 and sc1
    - Additional volumes supports ALL types
    - io1 and io2 can be multi-attached
    - io1 and io2 can be attached to multiple EC2 instances at the same time in same ZA

- **_Instance Store Volumes_**
  - If you stop and start the EC2 instance, Data is LOST/Deleted
  - Instance Store Volumes are FREE
  - Ephemeral Storage
  - If you terminate the EC2 , by default Root volume will be deleted because "delete on termination" is checked/Enabled
