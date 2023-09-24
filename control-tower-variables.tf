# AWS Control Tower Controls (sometimes called Guardrails) Input Variable Types

variable "controls" {
  type = list(object({
    control_names           = list(string)
    organizational_unit_ids = list(string)
  }))
  description = "Configuration of AWS Control Tower Guardrails for the whole organization"
  default = [
    {
      control_names = [
        "AWS-GR_ENCRYPTED_VOLUMES",
        "AWS-GR_EBS_OPTIMIZED_INSTANCE",
        "AWS-GR_EC2_VOLUME_INUSE_CHECK",
        "AWS-GR_RDS_INSTANCE_PUBLIC_ACCESS_CHECK",
        "AWS-GR_RDS_SNAPSHOTS_PUBLIC_PROHIBITED",
        "AWS-GR_RDS_STORAGE_ENCRYPTED",
        "AWS-GR_RESTRICTED_COMMON_PORTS",
        "AWS-GR_RESTRICTED_SSH",
        "AWS-GR_RESTRICT_ROOT_USER",
        "AWS-GR_RESTRICT_ROOT_USER_ACCESS_KEYS",
        "AWS-GR_ROOT_ACCOUNT_MFA_ENABLED",
        "AWS-GR_S3_BUCKET_PUBLIC_READ_PROHIBITED",
        "AWS-GR_S3_BUCKET_PUBLIC_WRITE_PROHIBITED",
      ],
      organizational_unit_ids = ["ou-1111-11111111", "ou-2222-22222222"],
    },
    {
      control_names = [
        "AWS-GR_SUBNET_AUTO_ASSIGN_PUBLIC_IP_DISABLED",
        "AWS-GR_AUTOSCALING_LAUNCH_CONFIG_PUBLIC_IP_DISABLED",
        "AWS-GR_DISALLOW_CROSS_REGION_NETWORKING",
        "AWS-GR_DISALLOW_VPC_INTERNET_ACCESS",
        "AWS-GR_DISALLOW_VPN_CONNECTIONS",
        "AWS-GR_DMS_REPLICATION_NOT_PUBLIC",
        "AWS-GR_EBS_SNAPSHOT_PUBLIC_RESTORABLE_CHECK",
        "AWS-GR_EC2_INSTANCE_NO_PUBLIC_IP",
        "AWS-GR_EKS_ENDPOINT_NO_PUBLIC_ACCESS",
        "AWS-GR_ELASTICSEARCH_IN_VPC_ONLY",
        "AWS-GR_EMR_MASTER_NO_PUBLIC_IP",
        "AWS-GR_LAMBDA_FUNCTION_PUBLIC_ACCESS_PROHIBITED",
        "AWS-GR_NO_UNRESTRICTED_ROUTE_TO_IGW",
        "AWS-GR_REDSHIFT_CLUSTER_PUBLIC_ACCESS_CHECK",
        "AWS-GR_S3_ACCOUNT_LEVEL_PUBLIC_ACCESS_BLOCKS_PERIODIC",
        "AWS-GR_SAGEMAKER_NOTEBOOK_NO_DIRECT_INTERNET_ACCESS",
        "AWS-GR_SSM_DOCUMENT_NOT_PUBLIC",
      ],
      organizational_unit_ids = ["ou-1111-11111111"],
    },
  ]
}
