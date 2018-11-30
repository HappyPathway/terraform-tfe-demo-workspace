variable "confirm_destroy" {
  default = true
}

variable "repo_name" {
  
}

variable "repo_description" {
    default = "Terraform Infrastructure Repository"
}
variable "repo_branch" {
    default = "master"
}

variable "oauth_token" {
  
}

variable "organization" {
  
}

variable "workspace_name" {
    type = "string"
    description = "Name of TFE Workspace"
}

variable "bind_repo" {
    default = true
    description = "Is this workspace backed up by a Github Repo?"
}

