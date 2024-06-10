module "resource_group" {
  count = var.deploy_resource_group ? 1 : 0

  source = "github.com/fjdev/terraform-azurerm-resource-group"

  name       = var.resource_group_name
  location   = var.location
  managed_by = var.managed_by
  tags       = try(var.tags.resource_group, null)
}
