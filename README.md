# terraform-modules

Reusable Terraform modules, linted on every push and pull request.

## Layout

- `modules/s3_bucket/` - passes all checks
- `modules/s3_bucket_bad/` - deliberately broken; shows each tool failing. **Delete it** once you have seen the failures, before enabling branch protection.
- `examples/s3_bucket/` - example calling the good module

## Run checks locally

```bash
brew install terraform tflint
pip3 install checkov

terraform fmt -check -recursive -diff
tflint --init && tflint --recursive
checkov -d modules --framework terraform --compact
```

Validate a single module:

```bash
cd modules/s3_bucket && terraform init -backend=false && terraform validate
```
