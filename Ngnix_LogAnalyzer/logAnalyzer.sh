#!/bin/bash

# The goal of this project is to help you practice some basic shell 
# scripting skills. You will write a simple tool to analyze logs 
# from the command line.

# Requirements

# Download the sample nginx access log file from here. The log file contains the following fields:

# IP address
# Date and time
# Request method and path
# Response status code
# Response size
# Referrer
# User agent

# You are required to create a shell script that reads the log file and 
# provides the following information:

# Top 5 IP addresses with the most requests
# Top 5 most requested paths
# Top 5 response status codes
# Top 5 user agents
# Here is an example of what the output should look like:

# Top 5 IP addresses with the most requests:
# 45.76.135.253 - 1000 requests
# 142.93.143.8 - 600 requests
# 178.128.94.113 - 50 requests
# 43.224.43.187 - 30 requests
# 178.128.94.113 - 20 requests

# Top 5 most requested paths:
# /api/v1/users - 1000 requests
# /api/v1/products - 600 requests
# /api/v1/orders - 50 requests
# /api/v1/payments - 30 requests
# /api/v1/reviews - 20 requests

# Top 5 response status codes:
# 200 - 1000 requests
# 404 - 600 requests
# 500 - 50 requests
# 401 - 30 requests
# 304 - 20 requests

# There are multiple ways to solve this challenge. Do some research 
# on awk, sort, uniq, head, grep, and sed commands. Stretch goal is 
# to come up with multiple solutions for the above problem. For example, 
# instead of using awk, you can use grep and sed to filter and count 
# the requests.


echo "Top 5 IPs addresses with the most requests:" # Print header

# Extract the first column (IP address), sort, count unique occurrences, sort numerically in reverse order, and get the top 5
awk '{print $1}' nginx-access.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

echo
echo "Top 5 most requested paths:" # Print header

# Extract the request method and path (3rd column), sort, count unique occurrences, sort numerically in reverse order, and get the top 5
awk '{print $7}' nginx-access.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

echo
echo "Top 5 response status codes:" # Print header

# Extract the response status code (9th column), sort, count unique occurrences, sort numerically in reverse order, and get the top 5
awk '{print $9}' nginx-access.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

echo
echo "Top 5 user agents:" # Print header

# Extract the user agent (12th column), sort, count unique occurrences, sort numerically in reverse order, and get the top 5
awk -F\" '{print $6}' nginx-access.log | sort | uniq -c | sort -nr | head -n 5 | awk '{print $2 " - " $1 " requests"}'

