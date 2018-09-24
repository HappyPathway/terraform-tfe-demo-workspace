variable "confirm_destroy" {
  default = true
}

variable "repo_name" {
  
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
