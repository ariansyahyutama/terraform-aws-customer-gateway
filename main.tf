locals {
  country   = var.country
  city      = var.city
  isp       = var.isp
  building  = var.building
}

resource "aws_customer_gateway" "this" {
  for_each = var.create ? var.customer_gateways : {}

  bgp_asn    = each.value["bgp_asn"]
  ip_address = each.value["ip_address"]
  type       = "ipsec.1"

  tags = merge(
    {
      Name = format("%s-%s-%s-%s", var.country, var.city, var.building, var.isp)
    },
    var.tags
  )
}
