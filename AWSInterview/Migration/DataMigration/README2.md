# Database Migration

- On-premises Data Center
  - Tables
  - Schemas
  - Views
  - Data
  - Stored Proc
  - Ocacle
  - MS SQL Server
- Database in AWS
  - Tables
  - Schemas
  - Views
  - Data
  - Stored Proc
  - Ocacle
  - MS SQL Server
- Source DB Engine = Target BD Engine, Its Called Homogeneous Migration
- Source DB Engine !== Target DB Engine, It's Heterogeneous Migration

- **_AWS DMS Source & Targets_**
  - AWS SCT + AWS DMS
  - SCT = Schema Migration Tool

- **_Migration Modes_**
  - Online Migration
  - offline Migration

- **_AWS DMS Lab_**
  - Source DataBase -> Online Migration(AWS DMS + SCT) -> Target Database
  - EC2 Public IP or Public DNS to Connect with DMS
  - MS SQL Management Studio to connect the MS SQL (Source DB)
  - MySql Workbench 8.0 CE to connect Aurora MySQL (Target DB)
  - AWS SCT will be installed in the source DB server

## Source Database -> Source Endpoint -> Replication Task -> Target EndPoint -> Target Database

- In DMS Process
  - create Replication instance: Work Like agent to process the data source to target
  - Source Endpoint : Source Connection point . (EC2, On-prem DataBase)
  - Target Endpoint : Target connection point . (RDS)
