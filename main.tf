# Resource definition
resource "aws_customer_gateway" "this" {
  for_each = var.create ? var.customer_gateways : {}

  bgp_asn    = each.value["bgp_asn"]
  ip_address = each.value["ip_address"]
  type       = "ipsec.1"

  tags = merge(
    {
      Name = format("%s", each.key)
    },
    var.tags
  )
}

# Output definition (should be outside of resource blocks)
output "gateway_details" {
  description = "Map of customer gateway IDs and IP addresses by key"
  value = {
    for k, v in aws_customer_gateway.this : k => {
      id = aws_customer_gateway.this[k].id
      ip_address = aws_customer_gateway.this[k].ip_address
    }
  }
}

# You should also keep your existing outputs if needed, or update them
output "ids" {
  value = [for cgw in aws_customer_gateway.this : cgw.id]
}

output "ip_add" {
  value = [for cgw in aws_customer_gateway.this : cgw.ip_address]
}

