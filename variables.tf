variable "network_link_services" {
  description = <<EOT
Map of network_link_services, attributes below
Required:
    - environment (block):
        - id (required)
    - network (block):
        - id (required)
Optional:
    - description
    - display_name
    - accept (block):
        - environments (optional)
        - networks (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
EOT

  type = map(object({
    description  = optional(string)
    display_name = optional(string)
    environment = object({
      id = string
    })
    network = object({
      id = string
    })
    accept = optional(object({
      environments = optional(set(string))
      networks     = optional(set(string))
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
    }))
  }))
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

