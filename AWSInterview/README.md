### Q. What is Cloud Computing ? What is AWS

- Cloud Computing is the delivery of computing services like servers, storage, databases, network, software, and AI over the internet (the cloud) instead of using physical hardware or local servers

- AWS (Amazon Web Services) is a cloud computing platform provide by Amazon, offering a wide range of services for building, deploying, and managing applications and infrastructure.

---

### Q. What are the 5 advantages of using aws over on-premises server?

- **_Cost Savings_**: pay-as-you-go-model as no need to buy expensive hardware; pay only for what you use. no maintenance costs

- **_Auto-scaling & Flexibility_**: Automatically increases or decreases resources based on demand, Instant load can be handled.

- **_High Availability_**
- **_Disaster Recovery_**
- **_Advance security_**

---

### Q. What are the main cloud service models? Difference between IaaS, PaaS, and SaaS? -

![Screenshot](https://prnt.sc/f6Zri8CBr7T7)

- On Premises Managed by Company
  - Application, Data, Runtime, Middleware, OS, Virtualization, Servers, Storage, Networking

- Managed by Developer
  - Application, Data

- Managed by IT/Infra Team
  - Runtime (.net, java, NodeJs), Middleware (Third party Software), OS (Windows, Linux), Virtualization (Docker), Servers (Physical Server), Network

- **_Now Cloud Provide some Service Like_**

- **_IAAS (Infrastructure as a Services)_**
  - Managed by Company
    - Application, Data, Runtime, Middleware, OS
  - Managed By AWS
    - Virtualization, Servers, Storage, Networking

- **_PaaS (Platform as a Service)_**
  - Managed by Company
    - Application, Data
  - Managed By AWS
    - Runtime, Middleware, OS, Virtualization, Servers, Storage, Networking

- **_SaaS (Software as a Service)_**
  - Managed By AWS
    - Application, Data, Runtime, Middleware, OS, Virtualization, Servers, Storage, Networking

---

### Q. What is the AWS Shared Responsibility Model ?

- The AWS Shared Responsibility Model defines who is responsible for what when using AWS cloud services, It splits responsibilities between AWS and customer (company)

---

### Q. What are the main categories of AWS services? What are the top 25 services?

- Compute, Database, Storage, Networking , Content Delivery Messaging , Integration Security, Infra/DevOps

- **_Compute_** : Elastic Beanstalk, EC2, Lambda, Amazon ECS

- **_Database:_** RDS, DynamoDB, Redis, Aurora.

- **_Storage:_** S3, EBS, EFS.

- **_Networking & Content Delivery:_** VPC, Route53, CloudFront, ELB, API Gateway.

- **_Messaging & Integration:_** SNS, SQS, Event Bridge

- **_Security:_** IAM, Secrets Manger, KMS

- **_Infra/DevOps:_** CloudFormation, CloudWatch, CodePipeline, CodeDeploy

---

### Q. What is Hybrid Cloud

- **_Hybrid Cloud_** = On-premises + AWS cloud
- Hybrid Cloud means combining on-premises infrastructure (like your own data center or servers) with AWS cloud services, so they work together

---

### Q. What is a Resource in AWS? How is it different from a Service in AWS?

- **_ AWS Service_** : A Service is a tool or feature offered by AWS to perform tasks like computing, storage, networking, or security

- **_ AWS Resource _** : A resource is AWS is an instance of a service that you create configure, and use in the cloud

**_Event Source Mapping and Event Filtering_** : An Event Source Mapping is a Lambda resource that reads from an event source and invokes a Lambda function on the basis of event Filtering

---
