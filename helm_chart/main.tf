resource "helm_release" "chart" {
  name       = var.helm_name
  repository = var.repository
  namespace = var.namespace
  chart      = var.chart
  version    = var.chart_version

  values = [
    file("${var.values_path}")
  ]
}