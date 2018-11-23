#!/usr/bin/python

import random

technologies = ['PySpark', 'Python', 'Spark', 'Scala',
                'JVM', 'Project Jupyter', 'PostgreSQL']

print("Technologies: %s" % technologies)

technologies.sort()
print("Sorted: %s" % technologies)

print("I'm interested in learning %s." % random.choice(technologies))
