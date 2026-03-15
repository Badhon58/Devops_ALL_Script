### Migration In AWS.

What is Migration?

- Migration is the process of moving from one platform to another, it can be migrating a web-based application, databases, virtual machines, and so on.
- Database migration is a complex, multiphase process, which usually includes the following:
  - Assessment of the migration task
  - Database Schema Conversion
  - Script Conversion
  - Data Migration
  - Functional Testing
  - Performance Tuning

### 7R's of Migration

1. Rehost - Lift and Shift. | Easy to migrate
   - Server 01 in on-prem --> Copy it to AWS and run it as a server. OS/App/Configuration/Setting remains the same.
2. Re-platform - It runs another type of platform? | Small changes required
   - SQL DB Server in on-prem and Iwant to move to cloud? SQL server on managed DB's PaaS/DBaaS.
   - PostgreSQL : Linux Server onprem.
   - PSQL on RDS : Same DB running on a manged platform.
3. Refactor (Re-architect) | Maximum changes - Lot of effort required
   - .Net 2.0 application which I wrote in 2013, Windows licensing.
   - . Net application core (Linux), containerize
   - AWS services like, ECS, EKS, Lambda
4. Relocate
   - VMWare servers, you move to VMware on AWS/Azure.
   - VMWare from Texas to California
5. Retain
   - Do nothing. continue to run as it is.
6. Repurchase

- Office suite, Word, Excel power, 0365, Salesforce, SAP.

7. Retire

- Decommission the servers, we don't need them anymore. Museum environment.

- Ms SQL server to Oracle/Postgres or any other RDBMS
  - Heterogeneous migration

---

### 7R Migration pattern

- **_Rehost (Lift & Shift)_** is a strategy of Re-hosting applications to AWS without making any changes to the on-premise application. One can use the AWS server migration service and AWS migration hub, containerize the application and then migrate it to AWS.
- **_Relocate (hypervisor-level lift & shift)_** is a strategy to move infrastructure to the cloud without purchasing new hardware, rewriting applications, or modifying your existing operations.
- **_Refactor_** is a strategy used for a need to add new features or in order to increase the scalability of the application or in order to boost your business continuity and productivity, most expensive strategy is usually executed after the initial migration via one of the approaches like Re-hosting
- **_Repurchase_** is the fastest way possible to access the cloud-based SaaS, it takes your company's existing data & applications and performs them clearly in a cloud-based product in order to manage operations such as HR, CRM, or CMS
- **_Re-platform (Lift, Tinker & Shift)_** when organizations have outdated structures to move into IaaS cloud platforms. Instead of Changing the core of the applications, they are emulated through a VM so that systems become compatible with modern-day cloud technologies without restructuring the systems
- **_Retain_** is a strategy to keep some elements in your on-premise which are not ready to migrate, focusing on Migrating what makes sense for the business.
- **_Retire_** is to identify the assets that are no longer useful and can be removed which helps in boosting your business case and giving attention towards maintaining the needful resources which can be widely used.
