resource "kubernetes_pod" "game_pod" {
  metadata {
    name = "2048-pod"
    labels = {
      app = "2048-ws"
    }
  }

  spec {
    container {
      image = "blackicebird/2048"
      name  = "2048-container"

      port {
        container_port = 80
      }
    }
  }
}

resource "kubernetes_service" "game_service" {
  metadata {
    name = "mygame-svc"
  }

  spec {
    selector = {
      app = kubernetes_pod.game_pod.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 80
      protocol    = "TCP"
    }

    type = "LoadBalancer"
  }
}
