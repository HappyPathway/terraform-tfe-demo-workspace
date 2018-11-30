resource "tfe_workspace" "ws_repo" {
  count = "${var.bind_repo ? 1 : 0}"
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

resource "tfe_workspace" "ws_no_repo" {
  count = "${var.bind_repo ? 0 : 1}"
  name = "${var.workspace_name}"
  organization = "${var.organization}"
  depends_on = [
    "github_repository.repo"
  ]
}

locals {
  workspace = "${var.bind_repo ? element(tfe_workspace.ws_repo, 0) : element(tfe_workspace.ws_no_repo, 0)}"
}
