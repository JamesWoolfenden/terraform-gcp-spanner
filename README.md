# terraform-gcp-spanner

Terraform module for Cloud Spanner. Exercises holden's `policies/gcp/database` (spanner-*)
and `policies/gcp/iam` (spanner-*) policy sets.

## Role and Permissions

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
# apply role
resource "google_project_iam_custom_role" "terraform_pike" {
  project     = "pike-477416"
  role_id     = "terraform_pike"
  title       = "terraform_pike"
  description = "A user with least privileges"
  permissions = [
    "spanner.databaseOperations.get",
    "spanner.databases.create",
    "spanner.databases.drop",
    "spanner.databases.get",
    "spanner.databases.getIamPolicy",
    "spanner.databases.setIamPolicy",
    "spanner.databases.update",
    "spanner.databases.updateDdl",
    "spanner.instanceOperations.get",
    "spanner.instances.create",
    "spanner.instances.delete",
    "spanner.instances.get",
    "spanner.instances.update"
  ]
}

# plan role
resource "google_project_iam_custom_role" "terraform_pike_plan" {
  project     = "pike-477416"
  role_id     = "terraform_pike_plan"
  title       = "terraform_pike_plan"
  description = "A user with least privileges"
  permissions = [
    "spanner.databaseOperations.get",
    "spanner.databases.get",
    "spanner.databases.getIamPolicy",
    "spanner.instanceOperations.get",
    "spanner.instances.get"
  ]
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->
