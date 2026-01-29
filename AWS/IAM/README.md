## IAM = Identity and access management

MFA = Multifactorial Authentication
There are two way to access the aws for the user or iam

- Console
- Programmatic

### IAM Group

- IAM Group = Collection of IAM users
- Group under group are not possible/ Nested Groups are not possible
- It is possible to attach multiple policies to the IAM users and Groups also, Max 10
- You can attach and detach the policies to the IAM Users and Groups
- If you attach any IAM user to the IAM Group, IAM User individual policies remains same and the new permissions will be inherited to the IAM User
- You can't assign/Create Keys to the Group
- Keys are only for IAM Users not for IAM Group
- An IAM user can be attached to multiple Group at the same time
- IAM Groups are used to assign policies to the bunch of IAM users at the same time
- Brand new IAM user will not have any permissions/Policies attached by default
- Policies -> Policy Documents -> Policy documents contains permissions
- Policies are written in JSON format: Policy are 2 types
  - Managed Policy : (Created and Managed by AWS (Predefined Policy))
  - Inline Policy : (Created and Managed by Customer || Customer managed Policy)
  - (Visual Editor / Policy Generator) -> Json Code is generated Automatically
  - ARN = Amazon Resources Name
- It will create a aws console link when we create a user

---

### IAM Role

- ROLES = Temporary access without credentials
- if you use the ROLE, We no need to configure keys on the EC@ instance
- based on the permissions that you have attached to the ROLE, those permissions are available from the Ec2 instance.
- 1 EC2 instance can have only 1 ROLE attached
- 1 Role can be attached to multiple EC2 instances
- SSO = Single Sign On

---

## IAM TAGS, Trusted Advisor, Inspector
