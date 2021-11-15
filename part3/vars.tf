variable "exec_node_count" {
  default = 2
}

variable "nfs_disk_size" {
  default = 3
}

variable "flavors" {
  type = map(string)
  default = {
    "central-manager" = "c1.denbi_cloud_user_meeting"
    "nfs-server"      = "c1.denbi_cloud_user_meeting"
    "exec-node"       = "c1.denbi_cloud_user_meeting"
  }
}

variable "image" {
  type = map(string)
  default = {
    "name"             = "vggp-v40-j255-a33bb037f9fb-master"
    "image_source_url" = "https://usegalaxy.eu/static/vgcn/vggp-v40-j255-a33bb037f9fb-master.raw"
    "container_format" = "bare"
    "disk_format"      = "raw"
  }
}

variable "public_network" {
  default = "public"
}

variable "private_network" {
  type = map(string)
  default = {
    name        = "tf_workshop-private"
    subnet_name = "tf_workshop-private-subnet"
    cidr4       = "192.168.199.0/24"
  }
}

variable "secgroups_cm" {
  type = list(string)
  default = [
    "public-ssh",
    "egress-public",
    "ingress-private"
  ]
}

variable "secgroups" {
  type = list(string)
  default = [
    "egress-public",
    "ingress-private"
  ]
}
