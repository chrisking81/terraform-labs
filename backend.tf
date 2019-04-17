terraform {
  backend "azurerm" {
    storage_account_name = "cktflabstate"
    container_name       = "tfstate"
    key                  = "371097a7-2295-41de-89b3-428d6d83bcf5.labs.terraform.tfstate"
    access_key           = "2106lIb9k88lL48YtQgnmYuhtgF87tiwGW8n/fDF/vLlQw0oljuhQwLbJhDSjR5YuIyJV3q/h3oG7LUgQAendw=="
  }
}
