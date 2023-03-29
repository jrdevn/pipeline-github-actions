variable "location" {
  description = "Variável que indica a região onde os recursos estão alocados"
  type        = string
  default     = "Brazil South"
}

variable "aws_pub_key" {
  description = "Public key aws for aws vm"
  type = string

}

variable "azure_pub_key" {
  description = "Public key azure for azure vm"
  type = string
}