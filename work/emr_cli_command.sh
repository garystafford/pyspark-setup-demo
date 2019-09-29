#!/bin/bash

# set -x

REGION=us-east-1
SUBNET_ID=subnet-3d467413
EMR_MANAGED_SLAVE_SECURITY_GROUP=sg-0e310382f06e4580e
EMR_MANAGED_MASTER_SECURITY_GROUP=sg-0fecf5b18a520d9a8
BUCKET=gstafford-aws-emr-notebooks
KEY_NAME=alluxio-key

aws emr create-cluster \
  --auto-scaling-role EMR_AutoScaling_DefaultRole \
  --termination-protected \
  --applications Name=Hadoop Name=Hive Name=Pig Name=Hue Name=Spark Name=Presto Name=Flink \
  --ebs-root-volume-size 20 \
  --ec2-attributes "{\"KeyName\":\"${KEY_NAME}\",
    \"InstanceProfile\":\"EMR_EC2_DefaultRole\",
    \"SubnetId\":\"${SUBNET_ID}\",
    \"EmrManagedSlaveSecurityGroup\":\"${EMR_MANAGED_SLAVE_SECURITY_GROUP}\",
    \"EmrManagedMasterSecurityGroup\":\"${EMR_MANAGED_MASTER_SECURITY_GROUP}\"}" \
  --service-role EMR_DefaultRole \
  --enable-debugging \
  --release-label emr-5.27.0 \
  --log-uri "s3n://${BUCKET}/logs" \
  --name 'emr-jupyter-demo' \
  --instance-groups '[{"InstanceCount":1,
    "EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":32,
    "VolumeType":"gp2"},
    "VolumesPerInstance":2}]},
    "InstanceGroupType":"MASTER",
    "InstanceType":"m5.xlarge",
    "Name":"Master - 1"},
    {"InstanceCount":2,
    "EbsConfiguration":{"EbsBlockDeviceConfigs":[{"VolumeSpecification":{"SizeInGB":32,
    "VolumeType":"gp2"},
    "VolumesPerInstance":2}]},
    "InstanceGroupType":"CORE",
    "InstanceType":"m5.xlarge",
    "Name":"Core - 2"}]' \
  --scale-down-behavior TERMINATE_AT_TASK_COMPLETION \
  --region $REGION \
  --bootstrap-actions "Path=s3://${BUCKET}/files/install-my-jupyter-libraries.sh,Name=installer"
