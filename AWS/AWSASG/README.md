- What is an Auto Scaling Group
  - An Auto Scaling Group is a feature of AWS that automatically adjust the number of EC2 instances in a group based on specified conditions.
  - It helps ensure that you have the right number of instances available to handle the load for your application at any given time

- Benefits of an Auto Scaling Group Benefits
  - High Availability
  - Cost Efficiency
  - Fault Tolerance
  - Elasticity
  - Easy Managements

- Horizontal scaling = Number of ec2 instance
- Vertical scaling = Increase the size of instance

- Two way to scale the auto scaling
  - Launch Configure
  - Launch template

- Launch Configure
  - An AWS launch Configuration is a template containing essential information required to launch instances in your AWS Auto Scaling Group.
  - It includes details such as the instance type, AMI ID, security groups, and other launch parameters

### AWS launch Template

- An AWS Launch Template is a newer version of Launch Configuration that provides more features and flexibility.
- It allows you to define configurations for launching EC2 instances, including instance type, AMI, security groups, and more.
- Benefits
  - Standardization
  - Flexibility
    - Versioning
    - Custom Scripts
    - Multiple Instance Types
  - Automation
  - Cost Savings
