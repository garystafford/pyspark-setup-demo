#!/usr/bin/python

import random

technologies = ['PySpark', 'Python', 'Spark', 'Scala', 'Java', 'Project Jupyter', 'PostgreSQL']

print("Technologies: %s\n" % technologies)

technologies.sort()
print("Sorted: %s\n" % technologies)

print("I'm interested in learning about %s." % random.choice(technologies))
