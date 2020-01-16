terraform {
    backend "azurerm" {
        storage_account_name = "tflabstorage"
        container_name       = "tfstate"
        key                  = "lab6.terraform.tfstate"
        access_key           = "ivNp0IvpNuYqD8u1sfABuYA5HUPJQJahP4Nss+xITHzdLMLL0pymymPM+tIhTOAWliuDKjsksut4qNFTCGWe0A=="
    }
}