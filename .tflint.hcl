plugin "terraform" {
  enabled = true
  preset  = "recommended"
}

plugin "aws" {
  enabled = true
  version = "0.40.0" # pin to the latest release from terraform-linters/tflint-ruleset-aws
  source  = "github.com/terraform-linters/tflint-ruleset-aws"
}
