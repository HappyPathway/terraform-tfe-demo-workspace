resource "tfe_variable" "CONFIRM_DESTROY" {
    count = "${var.confirm_destroy ? 1 : 0}"
  key = "CONFIRM_DESTROY"
  value = "1"
  category = "env"
  workspace_id =  "${tfe_workspace.ws.id}"
  sensitive = true
}