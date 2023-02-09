variable "instance_name" {
  description = "Nombre de la instancia de AWS"
  type        = string
  default     = "iaw-practica-14.2-docker"
}

variable "instance_ami" {
  description = "ID de la AMI de Ubuntu Server 20.04 LTS"
  type        = string
  default     = "ami-0778521d914d23bc1"
}

variable "ram_instance" {
  description = "Cantidad de RAM que se asigna a la instancia"
  type        = string
  default     = "t2.large"
}

variable "key_file_name" {
  description = "Nombre del archivo de claves SSH"
  type        = string
  default     = "vockey"
}