### EC2 = Elastic Compute Cloud

- Ec2 is a web service from AWS that provides Resizable Compute Services in the Cloud
- Resizable = Scale out and Scale In and Scale Up and Scale Down
- EC2 is Regional
- Servers=Instances
- Price= Pay as you go model
- Pay every hour
- 750 hours are free per month
- EC2 is a WebService from AWS that provides Resiable Compute Services in the Cloud
- Resizable = Scale Out and Scale Up and Scale Down
- Elasticity, Scalability
- It can be = Launch, Running -> Bill, Stol -> No Bill, Start, Reboot, Terminate -> No Bill
- Pricing Models is AWS
  - **_On-Demand instances_**
    - Fixed Price (Hourly)
    - Pay for what you have used
    - Pay per hour
    - No Commitment
    - No Upfront Payment
    - No Predictable Usage
  - **_Reserved Instances_**
    - Long Term commitment
    - 1 or 3 years
    - Upfront payment (Full, partial)
    - 75% discount in hours price
    - _Standard RI_ : 75% discount
    - _Converitable RI_ : To change the capacity of the instance anytime
    - _Scheduled RI_ : Reserve it for short term like fraction of a day, week or a month
  - **_SPOT Instances_** - Bidding - Auctioning - Huge Capacity for Cheaper price - 90% discount
    - Dedicated HOST
    - if you need a physical machine with VM's for the model
  - **_Savings Plans_**
    - It is same as RI but it has different strategy

---

### EC2 Families / instance Type

- General Instances = For General Purpose
- Memory Instances = If you need more memory for your application
- CPU instances = More Storage
- Storage Instances = Mode Instances
- GPU instances = for heavy machines, graphics cts
- Instance Type = CPU + Memory
- Scalability = Scale Up and Scale Down
- Scalability can be achieved by changing the instance type
- Anytime Scale Up --> No data lost
- Anytime Scale Down --> No data Lost
- Because data is stored in volumes
- You need to stop the Ec2 instance to change the instance type
- You need to have a downtime to change the instance type (if you have HA no need to have downtime)
- if you change the instance type, data is not lost because data is stored in EBS Volumes
