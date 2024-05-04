#!/bin/bash

# Variables
ELB_NAME="elb-name"
TAG_KEY="RTB1FR-node"

# Get instance IDs with the  tag
instance_ids=$(aws ec2 describe-instances --filters "Name=tag-key,Values=$TAG_KEY" \
    --query "Reservations[].Instances[].InstanceId" --output text)

# Check if there are instances with the tag
if [ -z "$instance_ids" ]; then
    echo "No instances found with tag $TAG_KEY."
    exit 1
fi

# Register instances with the ELB
for instance_id in $instance_ids; do
    echo "Registering instance $instance_id with ELB $ELB_NAME..."
    aws elb register-instances-with-load-balancer --load-balancer-name $ELB_NAME --instances $instance_id
done

echo "Successfully registered all instances with tag $TAG_KEY to ELB $ELB_NAME."
