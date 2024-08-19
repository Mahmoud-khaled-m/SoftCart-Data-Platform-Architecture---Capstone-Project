# SoftCart-Data-Platform-Architecture-Capstone-Project
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


## Architecture Overview

The following components are integral to the SoftCart data platform architecture:

1. **Data Sources:**
   - **MongoDB (NoSQL):** Stores catalog data including product details and availability.
   - **MySQL (Relational):** Stores transactional data such as sales, inventory, and customer information.

2. **Data Pipelines:**
   - Data is periodically extracted from **MongoDB** and **MySQL** and loaded into the **Staging Data Warehouse** using **Apache Airflow**.
   - Once the data is processed in the staging area, it is transferred to the **PostgreSQL** for further analysis.

3. **Big Data Analytics:**
   - Data from the staging warehouse is processed using **Apache Spark** to perform large-scale analytics, including customer behavior analysis and sales trend forecasting.
   - Hadoop is used as the distributed file system to store large datasets.

4. **Business Intelligence:**
   - **Google Looker** is utilized to create interactive dashboards for SoftCart’s business stakeholders, allowing them to visualize key metrics and insights derived from the processed data.

## Project Workflow

1. **Data Extraction:**
   - Data is periodically extracted from **MongoDB** and **MySQL**.
2. **Data Transformation:**
   - The extracted data is transformed according to the business logic using **Apache Spark**.
3. **Data Loading:**
   - Transformed data is loaded into the **Staging Warehouse** (PostgreSQL).
4. **Data Analysis & Reporting:**
   - The data is processed in **Apache Spark** for analytics.
   - Interactive dashboards are created using **Google Looker** to generate insights for business stakeholders.

## Lessons Learned

- Gained proficiency in designing and implementing **ETL pipelines** with **Apache Airflow**.
- Hands-on experience with a variety of databases including **NoSQL (MongoDB)** and **Relational Databases (MySQL, PostgreSQL)**.
- Deepened knowledge of **Big Data processing** with **Hadoop** and **Apache Spark**.
- Developed interactive BI dashboards using **Google Looker** for real-time data visualization.
![image](https://github.com/user-attachments/assets/beaabacf-5e56-4f82-a103-c5a9b1f57c20)
![image](https://github.com/user-attachments/assets/c3f263da-0e43-4a8e-8074-a543c63ff3d6)



