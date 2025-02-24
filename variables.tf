variable "image" {
  description = "Docker image à utiliser"
  type        = string
  default     = "nginx:latest"
}

variable "container_memory" {
  description = "Mémoire allouée pour le conteneur (en Mo)"
  type        = number
  default     = 128
}

variable "privileged" {
  description = "Le conteneur doit-il être privilégié ?"
  type        = bool
  default     = false
}

variable "container_count" {
  description = "Nombre de conteneurs à créer"
  type        = number
  default     = 1
}

variable "starting_port" {
  description = "Port de départ pour les conteneurs"
  type        = number
  default     = 3000
}
