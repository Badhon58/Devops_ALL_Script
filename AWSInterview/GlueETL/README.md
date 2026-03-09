project link => http://youtube.com/watch?v=ur9H68DmhVM

## What is AWS Glue and What is it used for

- Fully managed ETL Service by AWS
- Has two main features - Data Catalog and Spark ETL Engine

- Data Catalog
  - persistent technical metadata store
  - can connect to 70 different data sources and manage your data in a centralized data catalog
- ETL Engine
  - visually create, run, and monitor extract, transform, and load (ETL) pipelines to load data into your data lakes, Spark inbuilt

### AWS Glue Components

- **_AWS Glue Data Catalog_** : Database, Tables, Crawlers, Connection
- **_AWS Glue ETL_** : ETL Jobs, Triggers, Workflows

**_Database_**

- A Glue Database is a logical container within the AWS Glue Data Catalog that stores metadata tables.
- These tables contain information about data stored in various sources such as Amazon S3, Amazon RDS, Amazon Redshift, and more.
- The Glue Database helps organize and manage metadata, making it easier to catalog, search, and query your data assets.
- Not a physical database
