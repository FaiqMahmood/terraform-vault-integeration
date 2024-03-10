provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address          = "http://18.188.173.96:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = "db02de05-fa39-4855-059b-67221c5c2f63"
      secret_id = "6a174c20-f6de-a53c-74d2-6018fcceff64"
    }
  }
}

# Retrieve information
data "vault_kv_secret_v2" "example" {
  mount = "kv"
  name  = "test-secret"
}

resource "aws_instance" "hashi_vault_instance" {
  ami           = "ami-053b0d53c279acc90"
  instance_type = "t2.micro"

  tags = {
    Name   = "test"
    Secret = data.vault_kv_secret_v2.example.data["username"]
  }
}
