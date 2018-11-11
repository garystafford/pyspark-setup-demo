```bash
docker pull jupyter/all-spark-notebook:latest
docker stack deploy -c stack.yml pyspark
docker stack ps pyspark --no-trunc
docker logs $(docker ps | grep pyspark_pyspark.1 | awk '{print $NF}') --follow

cp postgresql-42.2.5.jar /usr/local/spark/jars
```

https://jdbc.postgresql.org/download.html
https://spark.apache.org/docs/latest/sql-programming-guide.html#jdbc-to-other-databases
https://stackoverflow.com/a/46944727/580268
