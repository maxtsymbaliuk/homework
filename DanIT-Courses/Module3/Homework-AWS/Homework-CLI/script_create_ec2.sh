#!/bin/bash

source .var

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

while true; do
echo  "Choose option:"
read choise

case $choise in
        exit) break;;
        1)
        echo "Create instance ec2:"
	aws ec2 run-instances --image-id ami-0bb84b8ffd87024d8 --count 1 --instance-type t2.micro;;

        2)
        echo "Create instance with tag:"
        aws ec2 run-instances --image-id ami-0bb84b8ffd87024d8 --count 1 --instance-type t2.micro --tag-specifications 'ResourceType=instance,Tags=[{Key=Owner,Value="maxtsymbaliuk"}]';;
	esac
done


# Get the list of all running EC2 instances
#instances=$(aws ec2 describe-instances --query 'Reservations[*].Instances[*].[InstanceId,Tags[*].Value]' --output text)

# Iterate over the instances
#while read -r instance; do
#    instance_id=$(echo $instance | awk '{print $1}')
#    owner=$(echo $instance | awk '{print $2}')
#
#    # If the instance has the tag "", terminate it
#    if [ "$owner" == "maxtsymbaliuk" ]; then
#        aws ec2 terminate-instances --instance-ids $instance_id
#        echo "Terminated instance $instance_id"
#    fi
#done <<< "$instances"
