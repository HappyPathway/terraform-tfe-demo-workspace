data "vault_generic_secret" "azure" {
    path = "${var.vault_azure_credentials_path}"
}

data "vault_aws_access_credentials" "creds" {
    count = "${var.aws_vars ? 1 : 0}"
    backend = "aws"
    role    = "ec2_admin"
}