#!/bin/bash

# Function to check if EC2 instance is running
check_ec2() {
    instance_status=$(aws ec2 describe-instances --instance-ids "INSTANCE_ID" --query "Reservations[].Instances[].State.Name" --output text)
    if [ "$instance_status" == "running" ]; then
        return 0  # Instance is running
    else
        return 1  # Instance is not running
    fi
}

# Function to start the EC2 instance if it's not running
start_ec2_if_not_running() {
    if ! check_ec2; then
        echo "EC2 instance is not running. Starting it up..."
        aws ec2 start-instances --instance-ids "INSTANCE_ID" &> /dev/null
    else
        echo "EC2 instance is already running."
    fi
}

# Main script
start_ec2_if_not_running

# Wait until the EC2 instance is running
while true; do
    if check_ec2; then
        echo "EC2 instance is now running."
        break
    else
        echo "Waiting for EC2 instance to start..."
        sleep 10  # Adjust the sleep time as needed
    fi
done
