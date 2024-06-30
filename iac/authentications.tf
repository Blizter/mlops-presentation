resource "tls_private_key" "argocd_deploy_key" {
  algorithm = "ED25519"
}

resource "github_user_ssh_key" "mlops_presentation" {
  title = "Argocd deploy key"
  key   = tls_private_key.argocd_deploy_key.public_key_openssh
}
