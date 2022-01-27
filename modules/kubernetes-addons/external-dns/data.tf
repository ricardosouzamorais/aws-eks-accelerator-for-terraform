data "aws_region" "current" {}


data "aws_route53_zone" "selected" {
  name = var.domain_name
}

data "aws_iam_policy_document" "external_dns_iam_policy_document" {
  statement {
    effect    = "Allow"
    resources = local.zone_filter_arns
    actions = [
      "route53:ChangeResourceRecordSets",
      "route53:ListResourceRecordSets"
    ]
  }

  statement {
    effect    = "Allow"
    resources = ["*"]
    actions = [
      "route53:ListHostedZones"
    ]
  }
}
