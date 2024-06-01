import boto3
import json

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')

    # Getting a list of stopped instances with the specified tag
    response = ec2.describe_instances(
        Filters=[
            {'Name': 'tag:Owner', 'Values': ['maxtsymbaliuk']},
            {'Name': 'instance-state-name', 'Values': ['stopped']}
        ]
    )

    instances_to_start = [
        instance['InstanceId']
        for reservation in response['Reservations']
        for instance in reservation['Instances']
    ]

    # Starting Instances
    started_instances = []
    if instances_to_start:
        starting_response = ec2.start_instances(InstanceIds=instances_to_start)
        started_instances = [inst['InstanceId'] for inst in starting_response['StartingInstances']]

    return {
        'statusCode': 200,
        'body': json.dumps({"started_instances": started_instances}),
        'headers': {'Content-Type': 'application/json'}
    }
