from datetime import timedelta
from airflow import DAG
from airflow.utils.dates import days_ago
from airflow.operators.bash import BashOperator

default_args = {
    'owner': 'airflow',
    'start_date': days_ago(1),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=1),
}

with DAG(
    dag_id='process_web_log',
    default_args=default_args,
    description='An Apache Airflow DAG to process web server logs',
    schedule_interval=timedelta(days=1),
    catchup=False,
) as dag:

    extract_data = BashOperator(
        task_id='extract_data',
        bash_command='cut -d" " -f1 /home/project/airflow/dags/capstone/accesslog.txt > /home/project/airflow/dags/capstone/extracted_data.txt',
    )

    transform_data = BashOperator(
        task_id='transform_data',
        bash_command='cat /home/project/airflow/dags/capstone/extracted_data.txt | grep "198.46.149.143" > /home/project/airflow/dags/capstone/transformed_data.txt',
    )

    load_data = BashOperator(
        task_id='load_data',
        bash_command='tar -cvf /home/project/airflow/dags/capstone/weblog.tar /home/project/airflow/dags/capstone/transformed_data.txt',
    )

    extract_data >> transform_data >> load_data
