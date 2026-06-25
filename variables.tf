variable "instance_name" {
  type        = string
  description = "Name of the Spanner instance"

  validation {
    condition     = length(trimspace(var.instance_name)) > 0
    error_message = "var.instance_name must be a non-empty string"
  }
}

variable "config" {
  type        = string
  description = "Spanner instance config (e.g. regional-europe-west2)"

  validation {
    condition     = length(trimspace(var.config)) > 0
    error_message = "var.config must be a non-empty string"
  }
}

variable "processing_units" {
  type        = number
  description = "Number of processing units for the Spanner instance"
  default     = 100
}

variable "database_name" {
  type        = string
  description = "Name of the Spanner database"

  validation {
    condition     = length(trimspace(var.database_name)) > 0
    error_message = "var.database_name must be a non-empty string"
  }
}

variable "kms_key_name" {
  type        = string
  description = "KMS CryptoKey ID used to encrypt the Spanner database (CMEK)"

  validation {
    condition     = length(trimspace(var.kms_key_name)) > 0
    error_message = "var.kms_key_name must be a non-empty string"
  }
}

variable "readers" {
  type        = list(string)
  description = "Members (e.g. serviceAccount:...) granted roles/spanner.databaseUser on the database, scoped per-database rather than at project level"
  default     = []

  validation {
    condition     = alltrue([for m in var.readers : !contains(["allUsers", "allAuthenticatedUsers"], m)])
    error_message = "var.readers must not contain allUsers or allAuthenticatedUsers"
  }
}
