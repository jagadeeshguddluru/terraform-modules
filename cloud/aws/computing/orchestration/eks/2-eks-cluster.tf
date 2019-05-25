resource "aws_eks_cluster" "main" {
  name     = "eks-${var.region_id}-${var.environment}-${var.cost_centre}-vpc${var.vpc_seq_id}-${var.app_service}-${var.seq_id}"
  role_arn = "${aws_iam_role.main.arn}"

  vpc_config {
    # refer 0-data.tf for following.
    subnet_ids = ["${data.aws_subnet_ids.private_app_subnets.ids}"]
  }
  
  depends_on = [
				"aws_iam_role_policy_attachment.eks-cluster-policy-attachment", 
				"aws_iam_role_policy_attachment.eks-service-policy-attachment"
				]
}