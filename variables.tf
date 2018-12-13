variable "loc" {
  description = "Default Azure region"
  default     = "WestUS2"
}

variable "tags" {
  default = {
    source = "citadel"
    env    = "training"
  }
}
