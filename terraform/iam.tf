data "aws_iam_role" "lab_role" {
  name = "LabRole"
}

resource "aws_iam_role_policy_attachment" "lab_role_cluster" {
  role       = data.aws_iam_role.lab_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "lab_role_vpc_controller" {
  role       = data.aws_iam_role.lab_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
}

resource "aws_iam_role_policy_attachment" "lab_role_worker" {
  role       = data.aws_iam_role.lab_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "lab_role_cni" {
  role       = data.aws_iam_role.lab_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "lab_role_ecr_readonly" {
  role       = data.aws_iam_role.lab_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}
