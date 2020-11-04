resource "azurerm_key_vault" "current" {
  name                = var.key_vault_name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = "89b0ba56-c903-46da-b1d8-2ee4728bafae"
  tags                = var.tags

  sku_name                    = var.key_vault_sku_name
  enabled_for_disk_encryption = true
  soft_delete_enabled         = true
}

resource "azurerm_key_vault_key" "current" {
  name         = var.key_vault_key_name
  key_vault_id = azurerm_key_vault.current.id
  key_type     = "RSA"
  key_size     = 2048

  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
}

resource "null_resource" "key-vault-enable-soft-delete" {
  provisioner "local-exec" {
    command = "az resource update --id $(az keyvault show --name ${azurerm_key_vault.current.name} -o tsv | awk '{print $1}') --set properties.enableSoftDelete=true"
  }
}

resource "azurerm_management_lock" "key-vault" {
  name       = "${azurerm_key_vault.current.name}-lock"
  scope      = azurerm_key_vault.current.id
  lock_level = "CanNotDelete"
  notes      = "Locked because it is used for disk encryption"
}