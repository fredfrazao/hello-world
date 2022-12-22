terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "hello" {
  name         = "ffr03/hello-world:latest"
  keep_locally = false
}

resource "docker_container" "hello" {
  image = docker_image.hello.latest
  name  = "hello"
  ports {
    internal = 3000
    external = 80
  }
}
