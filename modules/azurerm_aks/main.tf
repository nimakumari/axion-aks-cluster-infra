resource "azurerm_kubernetes_cluster" "aks_cluster" {
    for_each = var.child_aks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2s_v6"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Dev"
  }
}

# output "client_certificate" {
#   value     = azurerm_kubernetes_cluster.aks_cluster.kube_config[0].client_certificate
#   sensitive = true
# }

# output "kube_config" {
#   value = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw

#   sensitive = true
# }