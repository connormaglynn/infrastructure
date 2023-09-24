# AWS Control Tower Controls (sometimes called Guardrails) Outputs

output "ous_id_to_arn_map" {
  value       = local.ous_id_to_arn_map
  description = "Map from OU id to OU arn for the whole organization"
}
