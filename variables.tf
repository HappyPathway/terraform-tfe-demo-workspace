variable "aws_vars" {
    default = false
    description = "Flag for setting AWS Environment Variables"
}

variable "aws_default_region" {
  default = "us-east-1"
}

variable "azure_vars" {
  default = false
}

variable "confirm_destroy" {
  default = true
}

variable "repo_name" {
  
}

variable "repo_branch" {
    default = "master"
}
variable "vault_azure_credentials_path" {
  default = "secret/credentials/azure"
}


variable "vault_vars" {
    default = false
    description = "Flag for setting Vault Vars"
}

variable "vault_addr" {
    default = ""
}

variable "vault_token" {
  default = ""
}


variable "oauth_token" {
  
}

variable "github_org" {
  
}

variable "organization" {
  
}

variable "vault_gcp_credentials_path" {
  default = "secret/credentials/gcp"
}

variable "create_repo" {
    default = false
    type = "string"
    description = "Create Github Repo?"
}
