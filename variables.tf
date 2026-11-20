variable "instance_name" {
  type        = string
  description = "Name of the Spanner instance"

  validation {
    condition     = can(regex("^[a-z][-a-z0-9]{4,28}[a-z0-9]$", var.instance_name))
    error_message = "var.instance_name must be 6-30 characters: lowercase letters, digits and hyphens, starting with a letter and not ending with a hyphen"
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
  description = "Number of processing units for the Spanner instance (100-900 in steps of 100, or a multiple of 1000)"
  default     = 100

  validation {
    condition     = (var.processing_units >= 100 && var.processing_units < 1000 && var.processing_units % 100 == 0) || (var.processing_units >= 1000 && var.processing_units % 1000 == 0)
    error_message = "var.processing_units must be 100-900 in steps of 100, or a multiple of 1000"
  }
}

variable "database_name" {
  type        = string
  description = "Name of the Spanner database"

  validation {
    condition     = can(regex("^[a-z][a-z0-9_-]{0,28}[a-z0-9]$", var.database_name))
    error_message = "var.database_name must be 2-30 characters: lowercase letters, digits, underscores and hyphens, starting with a letter and ending with a letter or digit"
  }
}

variable "kms_key_name" {
  type        = string
  description = "KMS CryptoKey ID used to encrypt the Spanner database (CMEK)"

  validation {
    condition     = can(regex("^projects/[^/]+/locations/[^/]+/keyRings/[^/]+/cryptoKeys/[^/]+$", var.kms_key_name))
    error_message = "var.kms_key_name must be a full CryptoKey ID: projects/<project>/locations/<location>/keyRings/<ring>/cryptoKeys/<key>"
  }
}

variable "readers" {
  type        = list(string)
  description = "Members (e.g. serviceAccount:...) granted read-only roles/spanner.databaseReader on the database, scoped per-database rather than at project level"
  default     = []

  validation {
    condition     = alltrue([for m in var.readers : can(regex("^(user|serviceAccount|group|domain|principal|principalSet):.+", m))])
    error_message = "var.readers entries must be IAM principals with a type prefix (user:, serviceAccount:, group:, domain:, principal:, principalSet:); allUsers and allAuthenticatedUsers are not allowed"
  }
}

variable "writers" {
  type        = list(string)
  description = "Members (e.g. serviceAccount:...) granted read-write roles/spanner.databaseUser on the database, scoped per-database rather than at project level"
  default     = []

  validation {
    condition     = alltrue([for m in var.writers : can(regex("^(user|serviceAccount|group|domain|principal|principalSet):.+", m))])
    error_message = "var.writers entries must be IAM principals with a type prefix (user:, serviceAccount:, group:, domain:, principal:, principalSet:); allUsers and allAuthenticatedUsers are not allowed"
  }
}
