resource "random_password" "argocd_admin_password" {
  length  = 17
  special = true
}

resource "tls_private_key" "argocd_deploy_key" {
  algorithm = "ED25519"
}

resource "github_repository_deploy_key" "mlops_presentation" {
  title      = "Argocd deploy key"
  repository = "mlops-presentation"
  key        = tls_private_key.argocd_deploy_key.public_key_openssh
}
