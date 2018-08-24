resource "github_repository" "repo" {
  name        = "${var.repo_name}"
  description = "Test Repo"
  gitignore_template = "Terraform"
  private = false
}