### Terraform state locking

Terraform will lock your state for all operations that could write state. This prevents others from acquiring the lock and potentially corrupting your state.

For this we need to create a dynamodb table with Primary key as LockID, Here I have created dynamo db table terraform_lock.

terraform {
  backend "s3" {
    bucket = "shaniterraform"
   key    = "myproject/dev/terraform.tfstate"
   region = "us-east-2"
   access_key = ""
  secret_key = ""
    dynamodb_table="terraform_lock"
  }
}
