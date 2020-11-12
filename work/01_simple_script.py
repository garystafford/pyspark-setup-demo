#!/usr/bin/python3

import random

technologies = [ 'PySpark', 'Python', 'Spark', 'Scala', 'Java', 'Project Jupyter', 'R' ]

print(f"Technologies: {technologies}")

technologies.sort()
print(f"Sorted: {technologies}")

print(f"I'm interested in learning about {random.choice(technologies)}.")
