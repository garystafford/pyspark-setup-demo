# Jupyter Notebook PySpark Demo

Demo of [PySpark](http://spark.apache.org/docs/2.4.0/api/python/pyspark.html) and [Jupyter Notebook](http://jupyter.org/) with the [Jupyter Docker Stacks](https://jupyter-docker-stacks.readthedocs.io/en/latest/). Complete information for this project can be found by reading the related blog post, [Getting Started with PySpark for Big Data Analytics, using Jupyter Notebooks and Docker
](https://wp.me/p1RD28-6Fj)

## Architecture

![Architecture](https://programmaticponderings.files.wordpress.com/2019/12/jupyterdiagram.png)

## Set-up

1. Clone this project from GitHub:

    ```bash
    git clone \
        --branch v2 --single-branch --depth 1 --no-tags \
        https://github.com/garystafford/pyspark-setup-demo.git
    ```

2. Create `$HOME/data/postgres` directory for PostgreSQL files: `mkdir -p ~/data/postgres`
3. Optional, for local development, install Python packages: `python3 -m pip install -r requirements.txt`
4. Optional, pull docker images first:

    ```bash
    docker pull jupyter/all-spark-notebook:latest
    docker pull postgres:12-alpine
    docker pull adminer:latest
    ```

5. Deploy Docker Stack: `docker stack deploy -c stack.yml jupyter`
6. Retrieve the token to log into Jupyter: `docker logs $(docker ps | grep jupyter_spark | awk '{print $NF}')`
7. From the Jupyter terminal, run the install script: `sh bootstrap_jupyter.sh`
8. Export your Plotly username and api key to `.env` file:

    ```bash
    echo "PLOTLY_USERNAME=your-username" >> .env
    echo "PLOTLY_API_KEY=your-api-key" >> .env
    ```

## Demo

From a Jupyter terminal window:

1. Sample Python script, run `python3 01_simple_script.py` from Jupyter terminal
2. Sample PySpark job, run `$SPARK_HOME/bin/spark-submit 02_pyspark_job.py` from Jupyter terminal
3. Load PostgreSQL sample data, run `python3 03_load_sql.py` from Jupyter terminal
4. Sample Jupyter Notebook, open `04_notebook.ipynb` from Jupyter Console
5. Sample Jupyter Notebook, open `05_notebook.ipynb` from Jupyter Console
6. Try the alternate Jupyter stack with [nbextensions](https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html) pre-installed, first `cd docker_nbextensions/`, then run `docker build -t garystafford/all-spark-notebook-nbext:latest .` to build the new image
7. Then, to delete the previous stack, run `docker stack rm jupyter`, followed by creating the new stack, run `cd -` and `docker stack deploy -c stack-nbext.yml jupyter`

<img src="https://programmaticponderings.files.wordpress.com/2018/11/pyspark_article_11_notebook.png" alt="Jupyter Notebook" width="800"/>

## References

- [PostgreSQL JDBC Driver](https://jdbc.postgresql.org/download.html)
- [Spark SQL, DataFrames and Datasets Guide Spark](https://spark.apache.org/docs/latest/sql-programming-guide.html#jdbc-to-other-databases)
- [Lesson 42: Interactive plotting with Bokeh](http://justinbois.github.io/bootcamp/2017/lessons/l42_bokeh.html)
- [How to use SparkSession in Apache Spark 2.0](https://databricks.com/blog/2016/08/15/how-to-use-sparksession-in-apache-spark-2-0.html)
- [Advanced Jupyter Notebook Tricks — Part I](https://blog.dominodatalab.com/lesser-known-ways-of-using-notebooks/)
