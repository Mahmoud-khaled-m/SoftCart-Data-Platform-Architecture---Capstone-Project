# SoftCart-Data-Platform-Architecture---Capstone-Project
This project was developed as part of the IBM Data Engineering Professional Certificate Capstone, where I designed and implemented a data platform architecture for SoftCart, a fictional e-commerce company. 

## Project Description
SoftCart is an e-commerce platform with a large and diverse customer base accessing the website via multiple devices. The company requires an efficient and scalable data platform to manage its growing volume of transactional and catalog data, while also generating business insights from this data.

The architecture built for SoftCart leverages MySQL and MongoDB for storing transactional and catalog data respectively. This data is then extracted, transformed, and loaded (ETL) into staging data warehouses, with PostgreSQLserving as the data warehousing solution. The analytics process is powered by Hadoop and Apache Spark, with interactive dashboards created using Google Looker.

## Tools & Technologies
* OLTP Database: MySQL
* NoSQL Database: MongoDB
* Staging Data Warehouse: PostgreSQL
* Big Data Platform: Hadoop
* Big Data Analytics: Apache Spark
* Business Intelligence (BI) Dashboard: Google Looker
* Data Pipelines: Apache Airflow

## 🔧 Tools & Technologies

- **OLTP Database:** MySQL  
- **NoSQL Database:** MongoDB  
- **Staging Data Warehouse:** PostgreSQL  
- **Production Data Warehouse:** DB2 on Cloud  
- **Big Data Platform:** Hadoop  
- **Big Data Analytics:** Apache Spark  
- **Business Intelligence (BI) Dashboard:** IBM Cognos Analytics  
- **Data Pipelines:** Apache Airflow  
- **Cloud Provider:** IBM Cloud

## 🏗️ Architecture Overview

The following components are integral to the SoftCart data platform architecture:

1. **Data Sources:**
   - **MongoDB (NoSQL):** Stores catalog data including product details and availability.
   - **MySQL (Relational):** Stores transactional data such as sales, inventory, and customer information.

2. **Data Pipelines:**
   - Data is periodically extracted from **MongoDB** and **MySQL** and loaded into the **Staging Data Warehouse** using **Apache Airflow**.
   - Once the data is processed in the staging area, it is transferred to the **Production Data Warehouse (DB2 on Cloud)** for further analysis.

3. **Big Data Analytics:**
   - Data from the staging warehouse is processed using **Apache Spark** to perform large-scale analytics, including customer behavior analysis and sales trend forecasting.
   - Hadoop is used as the distributed file system to store large datasets.

4. **Business Intelligence:**
   - **IBM Cognos Analytics** is utilized to create interactive dashboards for SoftCart’s business stakeholders, allowing them to visualize key metrics and insights derived from the processed data.

