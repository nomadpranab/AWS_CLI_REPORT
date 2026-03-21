#!/bin/bash

set -x

############
#Author : Pranab
#Date : 21-03
#Version: v1
#
#This script will report the aws resources usage.
#	2. The script should report usage of:
#                EC2 → running/stopped instances
#		 S3 → number of buckets and size (if possible)
#		 RDS → database instances
#                Lambda Functions
#
#
##################################################
#
#List S3 buckets
#Test1
echo "List of S3 buckets"
aws s3 ls

#list EC2 Instance
echo "List of EC2 Instance ID that are running"

aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" --query "Reservations[].Instances[].{ID: InstanceId}" --output table
#List Lamba Functions
echo "Print list of lambda functions"
aws lambda list-functions

#List IAM Users
echo "Print Ia, users"
aws iam list-users
