variable "create" {
  description = "Whether to create Customer Gateway resources"
  type        = bool
  default     = true
}

variable "name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "customer_gateways" {
  description = "Maps of Customer Gateway's attributes (BGP ASN and Gateway's Internet-routable external IP address)"
  type        = map(map(any))
  default     = {}
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "country_id" {
  type      = string
  default     = ""
}

variable "city_id" {
  type      = string
  default     = ""
}

variable "isp_id" {
  type      = string
  default     = ""
}

variable "building_id" {
  type = string
  default     = ""
}
