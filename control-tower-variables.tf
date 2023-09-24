# AWS Control Tower Controls (sometimes called Guardrails) Input Variable Types

variable "controls" {

  type = list(object({
    control_names           = list(string)
    organizational_unit_ids = list(string)
  }))

  description = "Configuration of AWS Control Tower Guardrails for the whole organization"
}
