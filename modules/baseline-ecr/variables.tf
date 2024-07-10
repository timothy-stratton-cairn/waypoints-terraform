variable "name" {
  description = "Name of the image to create"
}

variable "scan_on_push" {
  default     = false
  description = "Enable or disable vulnerability scanning on push"
}

variable "accounts_pull_access" {
  default     = []
  description = "Other accounts permitted to pull this image"
}


variable "accounts_push_access" {
  default     = []
  description = "Other accounts permitted to push this"
}