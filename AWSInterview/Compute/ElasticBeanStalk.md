# Elastic Beanstalk, EC2, Lambda, Amazon ECS

## Elastic Beanstalk = PaaS

- ELastic Beanstalk Overview
- Eb Components
- Eb First Environment
- Launching an Advanced or Prod Environment
- Deployment Options or Policies
- EB Deployment Policy Hands On
- Implementing Blue/Green deployment
- Advanced Concept

## ELastic Beanstalk Overview

- Elastic beanstalk is a developer centric view of deploying an applications on AWS
- You can quickly deploy and manage applications
- No need to learn about the infrastructure that runs those application
- Reduced management complexity without restricting choice or control
- You simply upload your application
- Capacity provisioning, load balancing, scaling and application health monitoring
- BeanStalk is a service where you can create , run and mange application without worrying about the underlying infrastructure
- You can directly upload your website code to beanstalk, and it will automatically host the application for you with a URL.

## Eb Components

### Application : Its a logical collection or it combination of multiple elastic beanstalk component including

- Environments
- Versions
- Environment Configurations

### Application Version:

- An application source bundle or a deployable code (e.g. a Java.war file)
- An applications version is part of an application
- Applications can have many versions and each application version unique

### Environments:

- A collection of AWS resources running an application version
- Each Environment runs only one application version at a time
- You can run the same application version or different application versions in many environments simultaneously
- When you create an Environment, Elastic Beanstalk provisions the resources needed to run the application version you specified

### Configuring

- Service Role : An IAM role that Elastic BeanStalk assumes to interact with other AWS services (E.X. : Create EC2 instances, Load balancers, Auto Scaling Group)
- Ec2 Instance Profile: An IAM role that is attached to the EC2 instance in the Elastic Beanstalk Environment
  - Gives permissions for applications on those instances to interact with other AWS services(E.X. : Upload logs to S3, Write to an RDS database)
    - role : EC2
      - AWSElasticBeanstalkMulticontainerDocker
      - AWSElasticBeanstalkWebTier
      - AWSElasticBeanstalkWorkerTier

---

# Mini Project AWS Elastic Beanstalk

Introduction to AWS Elastic Beanstalk

- AWS Elastic BeanStack is a platform as a Service(PaaS) Solution that can help you deploy and manage your applications on WS, without having to individually configure and manage the underlying infrastructure that supports your application.
  - User upload code and elastic Beanstalk will configure the infrastructure.
  - The service will also provision support application platform versions.

**_Elastic Beanstalk uses CloudFormation to build the Infrastructure for your application_**

---

- Lambda =
