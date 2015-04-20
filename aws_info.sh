#!/bin/sh
#
# aws information script
#
# This script is used to gather information from ec2, rds, elasticache 
# and cloudformation form us-east-1 region and output it out as json
#
#
# Describe Ec2 Instances
echo "{ \"aws\":["
/usr/local/bin/aws ec2 describe-instances --region us-east-1
# Describe Rds Instances
echo ","
/usr/local/bin/aws rds describe-db-instances --region us-east-1
# Describe Elastic Load Balancer
echo ","
/usr/local/bin/aws elb describe-load-balancers --region us-east-1
# Describe Elasticache
echo ","
/usr/local/bin/aws elasticache describe-cache-clusters --region us-east-1
# Describe Cloud Formation
echo ","
/usr/local/bin/aws cloudformation describe-stacks --region us-east-1
echo "]}"
