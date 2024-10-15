resource "kubernetes_namespace" "monitoring" {
  metadata {
    annotations = {
      use = "monitoring"
    }
    labels = {
      use = "monitoring"
    }
    name = "monitoring"
  }
}

module "kuber-prometheus-stack" {
  source = "./helm_chart"
  helm_name = "grafana"
  #repository = "https://prometheus-community.github.io/helm-charts"
  chart = "prometheus-community/kube-prometheus-stack"
  chart_version = "65.2.0"
  values_path = "./values/stack.yaml"
  namespace = kubernetes_namespace.monitoring.metadata.0.name
}