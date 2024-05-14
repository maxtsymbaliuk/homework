import boto3
import json

def lambda_handler(event, context):
    ec2 = boto3.client('ec2')

    # Getting a list of running instances with the specified tag
    response = ec2.describe_instances(
        Filters=[
            {'Name': 'tag:Owner', 'Values': ['maxtsymbaliuk']},
            {'Name': 'instance-state-name', 'Values': ['running']}
        ]
    )

    instances_to_stop = [
        instance['InstanceId']
        for reservation in response['Reservations']
        for instance in reservation['Instances']
    ]

    # Stopping Instances
    stopped_instances = []
    if instances_to_stop:
        stopping_response = ec2.stop_instances(InstanceIds=instances_to_stop)
        stopped_instances = [inst['InstanceId'] for inst in stopping_response['StoppingInstances']]

    return {
        'statusCode': 200,
        'body': json.dumps({"stopped_instances": stopped_instances}),
        'headers': {'Content-Type': 'application/json'}
    }
