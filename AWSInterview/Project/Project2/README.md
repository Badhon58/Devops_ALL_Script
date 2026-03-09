## CSV Data Pipeline (S3, Lambda, Glue and QuickSight)

#### Project Overview

This project involves building a serverless data pipeline on AWS for processing CSV files. The pipeline automates the ingestion, transformation, and visualization of data. CSV files are uploaded to an raw data s3 bucket (CSV-RAW-DATA), triggering an AWS Lambda function to preprocess the data and store it in the processed data bucket (CSV-processed-data)

AWS Glue is then used for further ETL (Extract, Transform, Load) operations, and the final data is stored in final data bucket (CSV-Final-Data). Finally Amazon QuickSight is used to create interactive dashboards and reports for visualization the final data

### Services Used

- **_Amazon S3_** : USed for scalable storage of raw and processed data, providing event-driven architecture capabilities with S3 event notifications, [Storage]
- **_AWS Lambda_** : Acts as a serverless compute layer, automatically triggered to preprocess and clean CSV files upon upload to S3 [Compute]
- **_AWS Glue_** : Provides ETL capabilities to extract, transform , and load data into a usable format for analysis. [ETL/Big Data]
- **_Amazon QuickSight_** : Offers interactive dashboards and reports for real-time data visualization [Analytics]
- **_IAM Roles and Policies_** : Ensures secure access to S3, Lambda, Glue, and QuickSight. [Permissions]

### Architectural Diagram

- Raw CSV files are uploaded to the csv-raw-data S3 bucket, initiating the pipeline.
- An AWS Lambda Function is automatically triggered to read and preprocess the uploaded CSV files
- The Lambda function filters/formats data and storages the cleaned files in the csv-processed-data S3 bucket.
- An AWS Glue Crawler scans the processed data and identifies its schema for further processing
- The crawler updates the AWS Glue Data Catalog, creating a structured table for ETL operations
- Source -> Transform -> Store -> An AWS Glue Job extracts data from table created in Glue Data Catalog, transforms it, and loads the final output into the csv-final-data S3 bucket.
- Amazon QuickSight connects to the final dataset enabling interactive dashboards and reports for data visualization

### Steps to be Performed

- In this video , we'll be going through the following steps.
  1.  Setup and configuration
  2.  Data ingestion and preprocessing
  3.  Data transformation with AWS Glue
  4.  Data visualization with Amazon Quicksight
