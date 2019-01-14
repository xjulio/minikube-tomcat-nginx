provider "kubernetes" {
  config_context = "minikube"
}

resource "kubernetes_deployment" "tomcat" {
  metadata {
    name = "tomcat"
    labels {
      name = "tomcat"
    }
  }

  spec {
    selector {
      match_labels {
        name = "tomcat"
      }
    }  

    template {
      metadata {
        labels {
          name = "tomcat"
        }
      }

      spec {
        container {
          image = "tomcat:8.5-a1"
          name = "tomcat"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 8080
            host_port = 8090
          }
        }
      }
    }
  }
}

# nginx resources
resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "nginx"
    labels {
      name = "nginx"
    }
  }

  spec {
    selector {
      match_labels {
        name = "nginx"
      }
    }  

    template {
      metadata {
        labels {
          name = "nginx"
        }
      }

      spec {
        container {
          image = "nginx:a1"
          name = "nginx"
          image_pull_policy = "IfNotPresent"
          port {
            container_port = 80
            host_port = 8080
          }
        }
      }
    }
  }
}
