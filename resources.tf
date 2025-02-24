resource "docker_image" "nginx" {
  name         = var.image
  keep_locally = false
}

resource "docker_container" "nginx" {
  count = var.container_count

  name  = "nginx-${count.index}"
  image = docker_image.nginx.image_id

  memory     = var.container_memory
  privileged = var.privileged

  ports {
    internal = 80
    external = var.starting_port + count.index
  }
}
