terraform {
  required_version = ">= 1.0.0"

  backend "local" {
    path = "terraform.tfstate"
  }
}

module "llm_stack" {
  source = "../../"

  region               = var.region
  ami_id               = var.ami_id
  instance_type        = var.instance_type
  key_name             = var.key_name

}
