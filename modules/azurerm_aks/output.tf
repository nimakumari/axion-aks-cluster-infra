output "client_certificate" {
  value = {
    for key, cluster in azurerm_kubernetes_cluster.aks_cluster :
    key => cluster.kube_config[0].client_certificate
  }
}

output "kube_config" {
  value = {
    for key, cluster in azurerm_kubernetes_cluster.aks_cluster :
    key => cluster.kube_config_raw
  }
}
output "aks_principal_id" {
  value = {
    for key, cluster in azurerm_kubernetes_cluster.aks_cluster :
    key => cluster.identity[0].principal_id
  }
}