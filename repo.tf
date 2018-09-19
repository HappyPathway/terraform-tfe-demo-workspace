resource "github_repository" "repo" {
  count = "${var.create_repo ? 1 : 0}"
  name        = "${var.repo_name}"
  description = "Test Repo"
  gitignore_template = "Terraform"
  private = false
}
