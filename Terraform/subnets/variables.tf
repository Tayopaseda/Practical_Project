variable "vpc_id" {

}

variable "rds-1-cidr" {
  default = "28.7.0.0/24"
}

variable "rds-2-cidr" {
  default = "28.7.1.0/24"
}

variable "test-vm-cidr" {
  default = "28.7.2.0/24"
}

variable "cluster-1" {
  default = "28.7.3.0/24"
}

variable "cluster-2" {
  default = "28.7.4.0/24"
}

variable "cluster-3" {
  default = "28.7.5.0/24"
}
