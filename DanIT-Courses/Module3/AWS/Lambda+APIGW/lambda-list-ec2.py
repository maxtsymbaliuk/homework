import boto3

region = 'us-east-1'
ec2 = boto3.client('ec2', region_name=region)

def lambda_handler(event, context):
    instance_details = []
    response = ec2.describe_instances(Filters=[{'Name': 'instance-type', 'Values': ["t2.micro", "t3.micro"]}])
    instances_full_details = response['Reservations']
    for instance_detail in instances_full_details:
        group_instances = instance_detail['Instances']
        for instance in group_instances:
            instance_id = instance['InstanceId']
            instance_name = ''
            instance_ip = ''
            # Отримання тегу "Name", якщо він існує
            for tag in instance.get('Tags', []):
                if tag['Key'] == 'Name':
                    instance_name = tag['Value']
            # Отримання приватної IP-адреси
            instance_ip = instance.get('PrivateIpAddress', '')
            instance_details.append({'InstanceId': instance_id, 'Name': instance_name, 'PrivateIpAddress': instance_ip})
    return instance_details
