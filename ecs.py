import boto3
import json
# Create ECS client
client = boto3.client("ecs", region_name="eu-west-1")

# # ECS TaskSet Deletion
# # Pass ARN's of Cluster, Service and TaskSet
# def delete_task_set(region, taskset_arn, metadata, boto_session = None):
#     try:
#         client.delete_task_set(
#             cluster=metadata["cluster"],
#             service=metadata["service"],
#             taskSet=taskset_arn
#         )
#         print("ECS TaskSet {} is successfully deleted".format(taskset_arn))
#     except client.exceptions.TaskSetNotFoundException as e:
#         print(e)
#     except client.exceptions.ResourceNotFoundException as e:
#         print(e)
#
# # ECS Service Deletion
# # Pass Service ARN and Cluster ARN
# def delete_service(region, service_arn, metadata, boto_session = None):
#     try:
#         client.delete_service(
#             service=service_arn,
#             cluster=metadata["cluster"]
#         )
#         print("ECS Service {} is successfully deleted".format(service_arn))
#     except client.exceptions.ServiceNotFoundException as e:
#         print(e)
#     except client.exceptions.ResourceNotFoundException as e:
#         print(e)

# ECS Cluster Deletion
# Pass the Cluster ARN

def delete_cluster(region, cluster_arn, boto_session = None):
    try:
        response = client.list_container_instances(
            cluster=cluster_arn
        )
        container_instances = response['containerInstanceArns']
        if container_instances != []:
            for container_instance_arn in response['containerInstanceArns']:
                client.deregister_container_instance(
                    cluster=cluster_arn,
                    containerInstance=container_instance_arn
                )
            print('Container Instances are successfully deleted')
    except client.exceptions.ClusterNotFoundException as e:
        print(e)
    try:
        response = client.list_tasks(
            cluster=cluster_arn
        )
        tasks = response['taskArns']
        if tasks != []:
            for task_arn in response['taskArns']:
                client.stop_task(
                    cluster=cluster_arn,
                    task=task_arn
                )
            print('Tasks are stopped')
    except client.exceptions.ClusterNotFoundException as e:
        print(e)
    try:
        response = client.list_services(
            cluster=cluster_arn
        )
        services = response['serviceArns']
        if services != []:
            for service_arn in response['serviceArns']:
                client.delete_service(
                    cluster=cluster_arn,
                    service=service_arn,
                    force=True
                )
            print ('Services are successfully deleted')
    except client.exceptions.ClusterNotFoundException as e:
        print(e)
    try:
        client.delete_cluster(
            cluster=cluster_arn
        )
        print("ECS Cluster {} is successfully deleted".format(cluster_arn))
    except client.exceptions.ClusterNotFoundException as e:
        print(e)

# metadata_ecs_taskset = {
#     "cluster":"arn:aws:ecs:eu-west-1:853157869693:cluster/example-cluster",
#     "service":"arn:aws:ecs:eu-west-1:853157869693:service/myapp"
# }
#
# metadata_ecs_service = {
#     "cluster":"arn:aws:ecs:eu-west-1:853157869693:cluster/example-cluster"
# }
#
# delete_service("us-east-1", "arn:aws:ecs:eu-west-1:853157869693:service/myapp", metadata_ecs_service)
delete_cluster("eu-west-1", "arn:aws:ecs:eu-west-1:853157869693:cluster/example-cluster")
