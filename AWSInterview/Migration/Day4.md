# Day 04:

- Database Migration
- The databases that are migrated from a VM to VM, we will re-platform them from a VM to RDS

- ADTS = Active Directory Transfer Services
- ADCS = Active Directory Certificate Services
- ADFS = Active Directory Federation Services
- ADPS = Active Directory Privileged Services
- SQL =
- FSMO = Field Services Master Operation

- APDS(Additional Primary Domain Controller)
  - ADDS(ADC= Additional Domain Controller)
    - FSMO (Field Services Master Operation)
      - (PDC)

---

# Data Migration

CDC = Change Data Capture

- ADS = Application Discovery Services
- MGN = Application Migration Services
- DMS = Database Migration Services

### DMS Work

- From Source -> Target
- To complete the migration from Source to Target we need a tool name DMS.
- In DMS We connect both source and target. And The Types of configuration. It will give every details .
- In Source We hade to install DMS where we specify Table Size, Parameters, Format, Encryption and also Monitoring
- In Monitoring it will say how much % is complete to sync from source to On Pram to Target.
- Now in WeakEnd we will stop the server for 30 min then complete the sync on 100%

- DMS
  - MySQL to MySQL
  - PSQL to PSQL
- Homogeneous Migration
  - VM to RDS
  - VM to VM -
  - SQL to SQL
  - Oracle to Oracle
- Heterogenous
  - SQL Server to MYSQL
  - Oracle to PSQL

- Now if i want to changed to SQL Server to MySql then we need to use some tool name SCT (Schema Conversion Tools) it is also known as Schema conversion
