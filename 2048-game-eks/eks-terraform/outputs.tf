output "cluster_name" {
  value = aws_eks_cluster.eks.name
}

output "load_balancer_hostname" {
  value = kubernetes_service.game_service.status[0].load_balancer[0].ingress[0].hostname
}
output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint

}
