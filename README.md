# PySpark / Jupyter Notebook Demo

Demo of [PySpark](http://spark.apache.org/docs/2.4.0/api/python/pyspark.html) and [Jupyter Notebook](http://jupyter.org/) with the [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/). Complete information for this project can be found by reading the related blog post, [Getting Started with PySpark for Big Data Analytics, using Jupyter Notebooks and Docker
](http://wp.me/p1RD28-61V)

<img src="https://programmaticponderings.files.wordpress.com/2018/11/pysparkdocker1.png" alt="Architecture" width="700"/>

## Set-up

1. `git clone` this project from GitHub
2. Create `$HOME/data/postgres` directory for PostgreSQL files
3. For local development, install Python packages with `pip3 install -r requirements.txt` or `python3 -m pip install -r requirements.txt`
4. Deploy Docker Stack: `docker stack deploy -c stack.yml pyspark`
5. <del>Download 'BreadBasket*DMS.csv' from [kaggle](https://www.kaggle.com/xvivancos/transactions-from-a-bakery)</del> to the `work/` subdirectory *(This dataset was recently removed from kaggle. However, a copy is included as part of this project, ['BreadBasket_DMS.csv'](/work/BreadBasket_DMS.csv), or is available elsewhere on GitHub, for example, ['BreadBasket_DMS.csv'](https://github.com/prasertcbs/basic-dataset/blob/master/BreadBasket_DMS.csv). Thanks, [wsargent](https://github.com/wsargent) for this update!)\_
6. From the Jupyter terminal, install [Psycopg](http://initd.org/psycopg/docs/install.html#) Python PostgreSQL adapter: `pip install psycopg2-binary`

## Demo

From a Jupyter terminal window:

1. Sample Python script: `python ./01_simple_script.py`
2. Sample PySpark script: `$SPARK_HOME/bin/spark-submit 02_bakery_dataframes.py`
3. Load PostgreSQL sample data: `python ./03_load_sql.py`
4. Sample Jupyter Notebook: open `04_pyspark_demo_notebook.ipynb` from Jupyter Console

<img src="https://programmaticponderings.files.wordpress.com/2018/11/pyspark_article_11_notebook.png" alt="Jupyter Notebook" width="800"/>

## Misc. Commands

```bash
docker pull jupyter/all-spark-notebook:latest
docker stack ps pyspark --no-trunc
docker logs $(docker ps | grep pyspark_pyspark | awk '{print $NF}') --follow

docker stats --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}\t{{.MemPerc}}"

apt-get update -y && apt-get upgrade -y
apt-get install htop
htop --sort-key help
htop --sort-key

# optional from Jupyter terminal if not part of SparkSession spark.driver.extraClassPath
cp postgresql-42.2.8.jar /usr/local/spark/jars
```

## References

- [PostgreSQL JDBC Driver](https://jdbc.postgresql.org/download.html)
- [Spark SQL, DataFrames and Datasets Guide Spark](https://spark.apache.org/docs/latest/sql-programming-guide.html#jdbc-to-other-databases)
- [Lesson 42: Interactive plotting with Bokeh](http://justinbois.github.io/bootcamp/2017/lessons/l42_bokeh.html)
- [How to use SparkSession in Apache Spark 2.0](https://databricks.com/blog/2016/08/15/how-to-use-sparksession-in-apache-spark-2-0.html)
- [Advanced Jupyter Notebook Tricks — Part I](https://blog.dominodatalab.com/lesser-known-ways-of-using-notebooks/)
