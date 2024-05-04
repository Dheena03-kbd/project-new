#!/bin/bash

# Variables
ELB_NAME="your-elb-name"

# current registered instance IDs from ELB
registered_instances=$(aws elb describe-load-balancers --load-balancer-names $ELB_NAME --query 'LoadBalancerDescriptions[0].Instances[*].InstanceId' --output text)

# Check if there are instances to deregister
if [ -z "$registered_instances" ]; then
    echo "No instances are currently registered with ELB $ELB_NAME."
    exit 0
fi

# Deregister all instances from ELB
for instance_id in $registered_instances; do
    echo "Deregistering instance $instance_id from ELB $ELB_NAME..."
    aws elb deregister-instances-from-load-balancer --load-balancer-name $ELB_NAME --instances $instance_id
done

echo "Successfully deregistered all instances from ELB $ELB_NAME."
