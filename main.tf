/*common_tags = merge(
      var.additional_tags,
      {
          "ProductDomain" = var.product_domain
      },
      {
          "Environment" = var.environment
      },
      {
          "managedBy" = "terraform"
      }
  )*/

/*locals {
  country   = var.country_id
  city      = var.city_id
  isp       = var.isp_id
  building  = var.building_id
  }*/
resource "aws_customer_gateway" "this" {
  for_each = var.create ? var.customer_gateways : {}
  
  country   = var.country_id
  city      = var.city_id
  isp       = var.isp_id
  building  = var.building_id

  bgp_asn    = each.value["bgp_asn"]
  ip_address = each.value["ip_address"]
  type       = "ipsec.1"


  tags = merge(
    {
      Name = format("%s-%s-%s-%s", country, city, building, isp)
    },
    var.tags
  )
}
