import boto3
import json
# Create EKS client
client = boto3.client("eks", region_name="us-east-1")

# EKS NodeGroup Deletion
# Pass Cluster Name and Node Group Name
def delete_nodegroup(region, nodegroup_name, metadata, boto_session = None):
    try:
        client.delete_nodegroup(
            clusterName=metadata["cluster"],
            nodegroupName=nodegroup_name
        )
        print('Deleting NodeGroup {} will take few minutes!'.format(nodegroup_name))

        waiter = client.get_waiter('nodegroup_deleted')

        waiter.wait(
            clusterName=metadata["cluster"],
            nodegroupName=nodegroup_name
        )
        print('Node Group {} is successfully deleted'.format(nodegroup_name))

    except client.exceptions.ResourceNotFoundException as e:
        print(e)

# EKS Cluster Deletion
# Pass Cluster Name
def delete_cluster(region, cluster_name, boto_session = None):
    try:
        response = client.list_nodegroups(
            clusterName=cluster_name
        )
        nodegroups = response['nodegroups']
        # print(json.dumps(node_groups, indent=5, sort_keys=True, default=str))

        if nodegroups:

            for nodegroup_name in response['nodegroups']:
                client.delete_nodegroup(
                    clusterName=cluster_name,
                    nodegroupName=nodegroup_name
                )
                print('Deleting NodeGroup {} will take few minutes!'.format(nodegroup_name))
                waiter = client.get_waiter('nodegroup_deleted')
                waiter.wait(
                    clusterName=cluster_name,
                    nodegroupName=nodegroup_name
                )
                print('Node Group {} is successfully deleted'.format(nodegroup_name))
            print('All the Node Groups attached to the cluster {} are deleted successfully'.format(cluster_name))

    except client.exceptions.ResourceNotFoundException as e:
        print(e)

    try:
        client.delete_cluster(
            name=cluster_name
        )
        print("Cluster {} is successfully deleted".format(cluster_name))

    except client.exceptions.ResourceInUseException as e:
        print(e)
    except client.exceptions.ResourceNotFoundException as e:
        print(e)

metadata_eks_nodegroup = {
    "cluster":"test-eks-cluster"
}

delete_nodegroup('us-east-1', 'node-group-1', metadata_eks_nodegroup)
delete_cluster('us-east-1', 'test-eks-cluster')