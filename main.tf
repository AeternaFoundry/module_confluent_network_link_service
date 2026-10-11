resource "confluent_network_link_service" "network_link_services" {
  for_each = var.network_link_services

  description  = each.value.description
  display_name = each.value.display_name

  environment {
    id = each.value.environment.id
  }

  network {
    id = each.value.network.id
  }

  dynamic "accept" {
    for_each = each.value.accept != null ? [each.value.accept] : []
    content {
      environments = accept.value.environments
      networks     = accept.value.networks
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
    }
  }
}

