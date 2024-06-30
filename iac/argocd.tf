resource "helm_release" "argocd" {
  name             = "argocd"
  create_namespace = true
  namespace        = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  version          = "7.1.3"

  force_update    = true
  recreate_pods   = true
  cleanup_on_fail = true

  values = [
    templatefile("${path.module}/values.yaml",
      {
        gh_username = var.github_username,
        deploy_key  = split("\n", tls_private_key.argocd_deploy_key.private_key_pem),
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
