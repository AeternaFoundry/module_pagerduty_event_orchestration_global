variable "event_orchestration_globals" {
  description = <<EOT
Map of event_orchestration_globals, attributes below
Required:
    - event_orchestration
    - catch_all (block):
        - actions (required, block):
            - annotate (optional)
            - automation_action (optional, block):
                - auto_send (optional)
                - header (optional, block):
                    - key (required)
                    - value (required)
                - name (required)
                - parameter (optional, block):
                    - key (required)
                    - value (required)
                - trigger_types (optional)
                - url (required)
            - drop_event (optional)
            - escalation_policy (optional)
            - event_action (optional)
            - extraction (optional, block):
                - regex (optional)
                - source (optional)
                - target (required)
                - template (optional)
            - incident_custom_field_update (optional, block):
                - id (required)
                - value (required)
            - priority (optional)
            - route_to (optional)
            - severity (optional)
            - suppress (optional)
            - suspend (optional)
            - variable (optional, block):
                - name (required)
                - path (required)
                - type (required)
                - value (required)
    - set (block):
        - id (required)
        - rule (optional, block):
            - actions (required, block):
                - annotate (optional)
                - automation_action (optional, block):
                    - auto_send (optional)
                    - header (optional, block):
                        - key (required)
                        - value (required)
                    - name (required)
                    - parameter (optional, block):
                        - key (required)
                        - value (required)
                    - trigger_types (optional)
                    - url (required)
                - drop_event (optional)
                - escalation_policy (optional)
                - event_action (optional)
                - extraction (optional, block):
                    - regex (optional)
                    - source (optional)
                    - target (required)
                    - template (optional)
                - incident_custom_field_update (optional, block):
                    - id (required)
                    - value (required)
                - priority (optional)
                - route_to (optional)
                - severity (optional)
                - suppress (optional)
                - suspend (optional)
                - variable (optional, block):
                    - name (required)
                    - path (required)
                    - type (required)
                    - value (required)
            - condition (optional, block):
                - expression (required)
            - disabled (optional)
            - label (optional)
EOT

  type = map(object({
    event_orchestration = string
    catch_all = object({
      actions = object({
        annotate = optional(string)
        automation_action = optional(object({
          auto_send = optional(bool)
          header = optional(list(object({
            key   = string
            value = string
          })))
          name = string
          parameter = optional(list(object({
            key   = string
            value = string
          })))
          trigger_types = optional(list(string))
          url           = string
        }))
        drop_event        = optional(bool)
        escalation_policy = optional(string)
        event_action      = optional(string)
        extraction = optional(list(object({
          regex    = optional(string)
          source   = optional(string)
          target   = string
          template = optional(string)
        })))
        incident_custom_field_update = optional(list(object({
          id    = string
          value = string
        })))
        priority = optional(string)
        route_to = optional(string)
        severity = optional(string)
        suppress = optional(bool)
        suspend  = optional(number)
        variable = optional(list(object({
          name  = string
          path  = string
          type  = string
          value = string
        })))
      })
    })
    set = list(object({
      id = string
      rule = optional(list(object({
        actions = object({
          annotate = optional(string)
          automation_action = optional(object({
            auto_send = optional(bool)
            header = optional(list(object({
              key   = string
              value = string
            })))
            name = string
            parameter = optional(list(object({
              key   = string
              value = string
            })))
            trigger_types = optional(list(string))
            url           = string
          }))
          drop_event        = optional(bool)
          escalation_policy = optional(string)
          event_action      = optional(string)
          extraction = optional(list(object({
            regex    = optional(string)
            source   = optional(string)
            target   = string
            template = optional(string)
          })))
          incident_custom_field_update = optional(list(object({
            id    = string
            value = string
          })))
          priority = optional(string)
          route_to = optional(string)
          severity = optional(string)
          suppress = optional(bool)
          suspend  = optional(number)
          variable = optional(list(object({
            name  = string
            path  = string
            type  = string
            value = string
          })))
        })
        condition = optional(list(object({
          expression = string
        })))
        disabled = optional(bool)
        label    = optional(string)
      })))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.event_orchestration_globals : (
        length(v.set) >= 1
      )
    ])
    error_message = "Each set list must contain at least 1 items"
  }
}

