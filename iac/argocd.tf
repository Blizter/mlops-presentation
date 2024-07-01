resource "tls_private_key" "github" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "github_user_ssh_key" "argocd_key" {
  title = "ArgoCD deploy key"
  key   = tls_private_key.github.public_key_openssh
}

resource "helm_release" "argocd" {
  name             = "argocd"
  create_namespace = true
  namespace        = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "7.3.3"

  force_update    = true
  recreate_pods   = true
  cleanup_on_fail = true

  values = [
    templatefile("${path.module}/values.yaml",
      {
        gh_username = var.github_username,
        deploy_key  = split("\n", tls_private_key.github.private_key_pem)
    })
  ]
  set_sensitive {
    name  = "configs.secret.argocdServerAdminPassword"
    value = bcrypt("admin")
  }
}

resource "helm_release" "argocd-app-of-apps" {
  name       = "argocd-apps"
  namespace  = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  version    = "1.6.2"

  values = [
    templatefile("${path.module}/values-app.yaml",
      {
        gh_username = var.github_username
    })
  ]
  depends_on = [helm_release.argocd]
}
