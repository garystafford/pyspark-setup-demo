# PySpark / Jupyter Notebook Demo

Demo of PySpark and Jupyter Notebook with Jupyter Docker Stacks.

## Set-up

1. `git clone` this project from GitHub
2. Create `$HOME/data/postgre` directory for PostgreSQL files
3. Deploy Docker Stack: `docker stack deploy -c stack.yml pyspark`
4.  Download 'BreadBasket_DMS.csv' from [kaggle](https://www.kaggle.com/xvivancos/transactions-from-a-bakery) to `work/` directory
5.  From Jupyter terminal, install [Psycopg](http://initd.org/psycopg/docs/install.html#) Python PostgreSQL adapter: `pip install psycopg2 psycopg2-binary`

## Demo

From a Jupyter terminal window:

1.  Sample Python script: `python ./01_simple_script.py`
2.  Sample PySpark script: `python ./02_bakery_dataframes.py`
3.  Load PostgreSQL sample data: `python ./03_load_sql.py`
4.  Sample Jupyter Notebook: `python ./04_pyspark_demo_notebook.ipynb`

## Misc. Commands

```bash
docker pull jupyter/all-spark-notebook:latest
docker stack ps pyspark --no-trunc
docker logs $(docker ps | grep pyspark_pyspark.1 | awk '{print $NF}') --follow

# optional from Jupyter terminal if not part of SparkSession spark.driver.extraClassPath
cp postgresql-42.2.5.jar /usr/local/spark/jars
```

## References

* [PostgreSQL JDBC Driver
](https://jdbc.postgresql.org/download.html)
* [Spark SQL, DataFrames and Datasets Guide
Spark](https://spark.apache.org/docs/latest/sql-programming-guide.html#jdbc-to-other-databases)
