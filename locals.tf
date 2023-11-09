locals {
  project_tags = {
    contact = "wisebond@jjtech.com"
    apps = "payments"
    project = "wisebond"
    env = "${terraform.workspace}"
    creationTime = timestamp()
  }
}