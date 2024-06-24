output "argocd_admin_pwd" {
  value     = random_password.argocd_admin_password.result
  sensitive = true
}

output "gh_ssh_private_key" {
  value     = tls_private_key.argocd_deploy_key.private_key_pem
  sensitive = true
}
