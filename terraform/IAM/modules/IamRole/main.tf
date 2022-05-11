provider "aws" {
  region = "ap-south-1"
}

#-----------------------------------------------
# GENERATE AN IAM POLICY DOCUMENT IN JSON FORMAT
#-----------------------------------------------
data "aws_iam_policy_document" "demo" {
  statement {
    effect    = "Deny"
    actions   = [
            "elasticbeanstalk:CreateApplication",
            "elasticbeanstalk:CreateEnvironment",
            "elasticbeanstalk:DeleteApplication",
            "elasticbeanstalk:RebuildEnvironment",
            "elasticbeanstalk:TerminateEnvironment"
    ]
	resources = ["*"]
  }
}

# -------------------
# CREATE A IAM POLICY
# -------------------
resource "aws_iam_policy" "dev" {
  name = "dev_policy"
  path = "/"
  policy = data.aws_iam_policy_document.demo.json
}


# ---------------
# CREATE DEV ROLE
# ---------------
resource "aws_iam_role" "wezvademo_dev_role" {
  name               = "dev_role"
  assume_role_policy = data.aws_iam_policy_document.demo.json
}
