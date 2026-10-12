resource "pagerduty_event_orchestration_global" "event_orchestration_globals" {
  for_each = var.event_orchestration_globals

  event_orchestration = each.value.event_orchestration

  catch_all {
    actions {
      annotate = each.value.catch_all.actions.annotate
      dynamic "automation_action" {
        for_each = each.value.catch_all.actions.automation_action != null ? [each.value.catch_all.actions.automation_action] : []
        content {
          auto_send = automation_action.value.auto_send
          dynamic "header" {
            for_each = automation_action.value.header != null ? automation_action.value.header : []
            content {
              key   = header.value.key
              value = header.value.value
            }
          }
          name = automation_action.value.name
          dynamic "parameter" {
            for_each = automation_action.value.parameter != null ? automation_action.value.parameter : []
            content {
              key   = parameter.value.key
              value = parameter.value.value
            }
          }
          trigger_types = automation_action.value.trigger_types
          url           = automation_action.value.url
        }
      }
      drop_event        = each.value.catch_all.actions.drop_event
      escalation_policy = each.value.catch_all.actions.escalation_policy
      event_action      = each.value.catch_all.actions.event_action
      dynamic "extraction" {
        for_each = each.value.catch_all.actions.extraction != null ? each.value.catch_all.actions.extraction : []
        content {
          regex    = extraction.value.regex
          source   = extraction.value.source
          target   = extraction.value.target
          template = extraction.value.template
        }
      }
      dynamic "incident_custom_field_update" {
        for_each = each.value.catch_all.actions.incident_custom_field_update != null ? each.value.catch_all.actions.incident_custom_field_update : []
        content {
          id    = incident_custom_field_update.value.id
          value = incident_custom_field_update.value.value
        }
      }
      priority = each.value.catch_all.actions.priority
      route_to = each.value.catch_all.actions.route_to
      severity = each.value.catch_all.actions.severity
      suppress = each.value.catch_all.actions.suppress
      suspend  = each.value.catch_all.actions.suspend
      dynamic "variable" {
        for_each = each.value.catch_all.actions.variable != null ? each.value.catch_all.actions.variable : []
        content {
          name  = variable.value.name
          path  = variable.value.path
          type  = variable.value.type
          value = variable.value.value
        }
      }
    }
  }

  dynamic "set" {
    for_each = each.value.set
    content {
      id = set.value.id
      dynamic "rule" {
        for_each = set.value.rule != null ? set.value.rule : []
        content {
          actions {
            annotate = rule.value.actions.annotate
            dynamic "automation_action" {
              for_each = rule.value.actions.automation_action != null ? [rule.value.actions.automation_action] : []
              content {
                auto_send = automation_action.value.auto_send
                dynamic "header" {
                  for_each = automation_action.value.header != null ? automation_action.value.header : []
                  content {
                    key   = header.value.key
                    value = header.value.value
                  }
                }
                name = automation_action.value.name
                dynamic "parameter" {
                  for_each = automation_action.value.parameter != null ? automation_action.value.parameter : []
                  content {
                    key   = parameter.value.key
                    value = parameter.value.value
                  }
                }
                trigger_types = automation_action.value.trigger_types
                url           = automation_action.value.url
              }
            }
            drop_event        = rule.value.actions.drop_event
            escalation_policy = rule.value.actions.escalation_policy
            event_action      = rule.value.actions.event_action
            dynamic "extraction" {
              for_each = rule.value.actions.extraction != null ? rule.value.actions.extraction : []
              content {
                regex    = extraction.value.regex
                source   = extraction.value.source
                target   = extraction.value.target
                template = extraction.value.template
              }
            }
            dynamic "incident_custom_field_update" {
              for_each = rule.value.actions.incident_custom_field_update != null ? rule.value.actions.incident_custom_field_update : []
              content {
                id    = incident_custom_field_update.value.id
                value = incident_custom_field_update.value.value
              }
            }
            priority = rule.value.actions.priority
            route_to = rule.value.actions.route_to
            severity = rule.value.actions.severity
            suppress = rule.value.actions.suppress
            suspend  = rule.value.actions.suspend
            dynamic "variable" {
              for_each = rule.value.actions.variable != null ? rule.value.actions.variable : []
              content {
                name  = variable.value.name
                path  = variable.value.path
                type  = variable.value.type
                value = variable.value.value
              }
            }
          }
          dynamic "condition" {
            for_each = rule.value.condition != null ? rule.value.condition : []
            content {
              expression = condition.value.expression
            }
          }
          disabled = rule.value.disabled
          label    = rule.value.label
        }
      }
    }
  }
}

