variable "cluster_name" {
    #Seteado de esta manera para que se pida el nombre del cluster
  description = "Name of the EKS cluster"
  type        = string
}


variable "endpoint_cluster_dev " {
  description = "Name of the dev Endpoint provided by aws"
  type        = string
  default = ""
}
variable "endpoint_cluster_stage " {
  description = "Name of the stage Endpoint provided by aws"
  type        = string
  default = ""
}
variable "endpoint_cluster_prod " {
  description = "Name of the prod Endpoint provided by aws"
  type        = string
  default = ""
}

variable "certificate_authority_data_dev " {
  description = "Certificate authority provided by aws on cluster dev"
  type        = string
  default = ""
}

variable "certificate_authority_data_stage " {
  description = "Certificate authority provided by aws on cluster stage"
  type        = string
  default = ""
}

variable "certificate_authority_data_prod " {
  description = "Name of the prod Endpoint provided by aws on cluster prod"
  type        = string
  default = ""
}


variable "aws_key " {
  description = "Name of the aws access key "
  type        = string
  default     = ""
}

variable "aws_secret_key " {
  description = "Name of the aws secret access key "
  type        = string
  default     = ""
}

variable "region " {
  description = "Name of the aws secret access key "
  type        = string
  default     = "us-east-b"
}