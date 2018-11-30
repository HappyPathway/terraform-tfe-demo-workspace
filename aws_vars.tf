variable "aws_vars" {
    default = false
    description = "Flag for setting AWS Environment Variables"
}

variable "aws_default_region" {
  default = "us-east-1"
}

variable "aws_role" {
  default = "ec2_admin"
  type = "string"
  description = "Vault AWS Dynamic Secrets Role"
}
data "vault_aws_access_credentials" "creds" {
    count = "${var.aws_vars ? 1 : 0}"
    backend = "aws"
    role    = "${var.aws_role}"
}

resource "tfe_variable" "AWS_ACCESS_KEY_ID" {
  count = "${var.aws_vars ? 1 : 0}"
  key = "AWS_ACCESS_KEY_ID"
  value = "${data.vault_aws_access_credentials.creds.access_key}"
  category = "env"
  workspace_id = "${local.workspace["id"]}"
}

resource "tfe_variable" "AWS_SECRET_ACCESS_KEY" {
  count = "${var.aws_vars ? 1 : 0}"
  key = "AWS_SECRET_ACCESS_KEY"
  value = "${data.vault_aws_access_credentials.creds.secret_key}"
  category = "env"
  workspace_id = "${local.workspace["id"]}"
  sensitive = true
}

resource "tfe_variable" "AWS_DEFAULT_REGION" {
  count = "${var.aws_vars ? 1 : 0}"
  key = "AWS_DEFAULT_REGION"
  value = "${var.aws_default_region}"
  category = "env"
  workspace_id = "${local.workspace["id"]}"
  sensitive = true
}