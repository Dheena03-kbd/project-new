#!/bin/bash
set -x

b=5


ASG=RTB1FR-c5d_m5d.2xl 
count=`aws autoscaling describe-auto-scaling-groups --auto-scaling-group-name $ASG --region eu-central-1 --output json | grep -i -e DesiredCapacity | tr -d ' "MGouAnWmPool MWmPool MGou ,  :DesiredCapacity'`

a=$count

sum=$(( $a + $b ))


aws autoscaling update-auto-scaling-group --auto-scaling-group-name $ASG --region eu-central-1 --desired-capacity $sum --min-size $sum --max-size $sum --output json