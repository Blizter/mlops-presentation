terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "6.2.1"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.14.0"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.5"
    }
  }
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }
}

provider "github" {

}

provider "tls" {

}
