variable "github_org" {
  
}

variable "create_repo" {
    default = false
    type = "string"
    description = "Create Github Repo?"
}

resource "github_repository" "repo" {
  count = "${var.create_repo ? 1 : 0}"
  name        = "${var.repo_name}"
  description = "${var.repo_description}"
  gitignore_template = "Terraform"
  private = false
}
