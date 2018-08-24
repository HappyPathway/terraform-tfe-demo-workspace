resource "github_repository" "repo_dest" {
  name        = "${var.repo_name}"
  description = "Test Repo"
  gitignore_template = "Terraform"
  private = false
}