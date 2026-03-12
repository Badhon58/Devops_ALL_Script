### Data Lake Storage Layers

- Zone Name - Alternative Name - Purpose
- Landing Zone - Bronze Layer - Stores raw, unprocessed data from various sources (logs, databases, IOT, Etc.)
- processed Zone - Silver Layer - Stores cleaned, transformed, and structured data, removing duplicates and inconsistencies.
- Analytics Zone - Gold Layer - Stores aggregated, curated, and analytics-ready data for reporting, BL, and ML models

### Data Sources layers

- [Data Sources]
  - S3 (sales CSV Files)
  - PostgreSQL (Customer Data)

- [Data Lake - S3]
  - Bronze Layer (Raw Data)
    - s3://mydata/bronze/sales/
    - s3://mydata/bronze/customers/
  - silver Layer (Raw Data)
    - s3://mydata/silver/sales/
    - s3://mydata/silver/customers/
  - gold Layer (Raw Data)
    - s3://mydata/gold/sales/
    - s3://mydata/gold/customers/

- E:X:
  - s3://mydata/bronze/sales/
    - year = 2025
      - month=02/
        - day=24/
          - sales-20250224.csv (5GB: Sale_Id, Amount, Sale_date, region)
        - day=25/
          - sales-20250225.csv (5GB)

### ETL Partition

- [ETL Pipeline - AWS Glue]
  - Crawlers (Catalog Data)
  - Jobs (Full/Incremental Load. Transform)
  - WorkFlows (Automation)
- [Data Warehouse - Redshift]
  - Staging Tables (Temporary Load)
  - Core Tables(Final Data)
- [Automation & CI/CD]
  - AWS CodePipeline (Code Deployment)
  - CloudWatch Events (Scheduling)
  - Monitoring (Logs, Alerts)
