#!/usr/bin/python3

from pyspark.sql import SparkSession

spark = SparkSession \
    .builder \
    .appName('spark-demo') \
    .getOrCreate()

df_bakery = spark.read \
    .format('csv') \
    .option('header', 'true') \
    .option('delimiter', ',') \
    .option('inferSchema', 'true') \
    .load('BreadBasket_DMS.csv')

df_sorted = df_bakery.cube('item').count() \
    .filter('item NOT LIKE \'NONE\'') \
    .filter('item NOT LIKE \'Adjustment\'') \
    .orderBy(['count', 'item'], ascending=[False, True])

df_sorted.show(10, False)

df_sorted.coalesce(1) \
    .write.format('csv') \
    .option('header', 'true') \
    .save('output/items-sold.csv', mode='overwrite')
