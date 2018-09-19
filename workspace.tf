resource "tfe_workspace" "ws" {
  name = "${var.workspace_name}"
  organization = "${var.organization}"
  vcs_repo = {
      identifier = "${var.github_org}/${var.repo_name}"
      branch = "${var.repo_branch}"
      oauth_token_id = "${var.oauth_token}"
      ingress_submodules = true
  }
  depends_on = [
    "github_repository.repo"
  ]
}
