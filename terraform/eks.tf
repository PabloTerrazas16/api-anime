resource "aws_eks_cluster" "main" {
  name     = var.cluster_name
  role_arn = data.aws_iam_role.lab_role.arn

  vpc_config {
    subnet_ids              = aws_subnet.public[*].id
    endpoint_private_access = false
    endpoint_public_access  = true
  }

  enabled_cluster_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  tags = local.common_tags

  depends_on = [
    aws_cloudwatch_log_group.eks_cluster,
    aws_iam_role_policy_attachment.lab_role_cluster,
    aws_iam_role_policy_attachment.lab_role_vpc_controller
  ]
}

resource "aws_eks_node_group" "main" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "${var.project_name}-nodes"
  node_role_arn   = data.aws_iam_role.lab_role.arn
  subnet_ids      = aws_subnet.public[*].id

  instance_types = [var.node_instance_type]

  scaling_config {
    desired_size = var.desired_nodes
    min_size     = var.min_nodes
    max_size     = var.max_nodes
  }

  tags = local.common_tags

  depends_on = [
    aws_iam_role_policy_attachment.lab_role_worker,
    aws_iam_role_policy_attachment.lab_role_cni,
    aws_iam_role_policy_attachment.lab_role_ecr_readonly
  ]
}
