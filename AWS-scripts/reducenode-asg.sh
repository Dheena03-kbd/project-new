#!/bin/bash

# Set AWS region and Auto Scaling Group name
AWS_REGION="aws_region" #we have enter our region
ASG_NAME="auto_scaling_group_name" #we have enter our asg name

# Retrieve the current capacity settings of the Auto Scaling Group
current_capacity=$(aws autoscaling describe-auto-scaling-groups \
    --auto-scaling-group-names $ASG_NAME \
    --query "AutoScalingGroups[0].[DesiredCapacity, MinSize, MaxSize]" \
    --output text \
    --region $AWS_REGION)

current_desired_capacity=$(echo $current_capacity | awk '{print $1}')
current_min_capacity=$(echo $current_capacity | awk '{print $2}')
current_max_capacity=$(echo $current_capacity | awk '{print $3}')

echo "Current capacity settings of $ASG_NAME:"
echo "Desired capacity: $current_desired_capacity"
echo "Minimum capacity: $current_min_capacity"
echo "Maximum capacity: $current_max_capacity"

# Specify the new desired, minimum, and maximum capacities
new_desired_capacity=$((current_desired_capacity - 3))
new_min_capacity=$((current_min_capacity - 3))
new_max_capacity=$((current_max_capacity - 3))

echo "Updating capacity settings..."
echo "New desired capacity: $new_desired_capacity"
echo "New minimum capacity: $new_min_capacity"
echo "New maximum capacity: $new_max_capacity"

# Update the capacity settings of the Auto Scaling Group
aws autoscaling update-auto-scaling-group \
    --auto-scaling-group-name $ASG_NAME \
    --desired-capacity $new_desired_capacity \
    --min-size $new_min_capacity \
    --max-size $new_max_capacity \
    --region $AWS_REGION
# Display 
echo "Capacity settings updated successfully!"


