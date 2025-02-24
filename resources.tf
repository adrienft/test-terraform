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

  upload {
    content = file("./files/nginx.conf")
    file    = "/etc/nginx/conf.d/default.conf"
  }

  upload {
    content = file("./files/index.html")
    file    = "/usr/share/nginx/html/index.html"
  }
}
