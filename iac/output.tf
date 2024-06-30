output "gh_ssh_private_key" {
  value     = tls_private_key.argocd_deploy_key.private_key_pem
  sensitive = true
}
