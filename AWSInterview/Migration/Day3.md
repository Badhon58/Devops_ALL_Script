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
