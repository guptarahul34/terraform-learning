locals {
  name = "demo-clb"
  common_tags = {
    env = var.environment
    owner = var.owner
  }
}