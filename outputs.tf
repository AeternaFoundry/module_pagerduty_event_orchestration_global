output "event_orchestration_globals_id" {
  description = "Map of id values across all event_orchestration_globals, keyed the same as var.event_orchestration_globals"
  value       = { for k, v in pagerduty_event_orchestration_global.event_orchestration_globals : k => v.id }
}
output "event_orchestration_globals_catch_all" {
  description = "Map of catch_all values across all event_orchestration_globals, keyed the same as var.event_orchestration_globals"
  value       = { for k, v in pagerduty_event_orchestration_global.event_orchestration_globals : k => one(v.catch_all) }
}
output "event_orchestration_globals_event_orchestration" {
  description = "Map of event_orchestration values across all event_orchestration_globals, keyed the same as var.event_orchestration_globals"
  value       = { for k, v in pagerduty_event_orchestration_global.event_orchestration_globals : k => v.event_orchestration }
}
output "event_orchestration_globals_set" {
  description = "Map of set values across all event_orchestration_globals, keyed the same as var.event_orchestration_globals"
  value       = { for k, v in pagerduty_event_orchestration_global.event_orchestration_globals : k => v.set }
}

