data "vault_generic_secret" "azure" {
    path = "${var.vault_azure_credentials_path}"
}