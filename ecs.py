import boto3
import json
# Create ECS client
client = boto3.client("ecs", region_name="eu-west-1")

# ECS TaskSet Deletion
# Pass ARN's of Cluster, Service and TaskSet
def delete_taskset(region, taskset_arn, metadata, boto_session = None):

    try:
        client.delete_task_set(
            cluster=metadata["cluster"],
            service=metadata["service"],
            taskSet=taskset_arn
        )
        print("TaskSet {} is successfully deleted".format(taskset_arn))

    except client.exceptions.TaskSetNotFoundException as e:
        print(e)
    except client.exceptions.ServiceNotActiveException as e:
        print(e)
    except client.exceptions.ServiceNotFoundException as e:
        print(e)
    except client.exceptions.ClusterNotFoundException as e:
        print(e)

# ECS Service Deletion
# Pass Service ARN and Cluster ARN
def delete_service(region, service_arn, metadata, boto_session = None):

    try:
        client.delete_service(
            service=service_arn,
            cluster=metadata["cluster"],
            force=True
        )
        print("Service {} is successfully deleted".format(service_arn))

    except client.exceptions.ServiceNotFoundException as e:
        print(e)
    except client.exceptions.ClusterNotFoundException as e:
        print(e)


# ECS Cluster Deletion
# Pass the Cluster ARN
def delete_cluster(region, cluster_arn, boto_session = None):

    try:
        response = client.list_tasks(
            cluster=cluster_arn
        )
        tasks = response['taskArns']
        if tasks:
            for task_arn in response['taskArns']:
                client.stop_task(
                    cluster=cluster_arn,
                    task=task_arn
                )
            print('Running tasks are stopped')

    except client.exceptions.ClusterNotFoundException as e:
        print(e)

    try:
        response = client.list_container_instances(
            cluster=cluster_arn
        )
        container_instances = response['containerInstanceArns']
        if container_instances:
            for container_instance_arn in response['containerInstanceArns']:
                client.deregister_container_instance(
                    cluster=cluster_arn,
                    containerInstance=container_instance_arn
                )
            print('Container Instances are successfully deregistered')

    except client.exceptions.ClusterNotFoundException as e:
        print(e)

    try:
        response = client.list_services(
            cluster=cluster_arn
        )
        services = response['serviceArns']
        if services:
            for service_arn in response['serviceArns']:
                client.delete_service(
                    cluster=cluster_arn,
                    service=service_arn,
                    force=True
                )
            print ('Services are successfully deleted')

    except client.exceptions.ClusterNotFoundException as e:
        print(e)

    response = client.list_task_definitions()
    task_definitions = response['taskDefinitionArns']

    if task_definitions:

        for task_definition_arn in response['taskDefinitionArns']:
            client.deregister_task_definition(
                taskDefinition=task_definition_arn
            )
        print('Task Definitions are successfully deregistered')

    try:
        client.delete_cluster(
            cluster=cluster_arn
        )
        print("Cluster {} is successfully deleted".format(cluster_arn))

    except client.exceptions.ClusterNotFoundException as e:
        print(e)

metadata_ecs_taskset = {
    "cluster":"arn:aws:ecs:eu-west-1:853157869693:cluster/example-cluster",
    "service":"arn:aws:ecs:eu-west-1:853157869693:service/test-ecs-external-service"
}

metadata_ecs_service = {
    "cluster":"arn:aws:ecs:eu-west-1:853157869693:cluster/example-cluster"
}

delete_taskset("eu-west-1", "arn:aws:ecs:eu-west-1:853157869693:task-set/example-cluster/test-ecs-external-service/ecs-svc/9223370463167764101", metadata_ecs_taskset)
delete_service("eu-west-1", "arn:aws:ecs:eu-west-1:853157869693:service/test-ecs-service", metadata_ecs_service)
delete_cluster("eu-west-1", "arn:aws:ecs:eu-west-1:853157869693:cluster/example-cluster")
