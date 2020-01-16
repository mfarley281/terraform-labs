variable "loc" {
    description = "Default Azure region"
    default     = "westeurope"
}

variable "tags" {
    default     = {
        source  = "citadel"
        env     = "training"
    }
}

variable "webapplocs" {
    default = [ "eastus2", "uksouth", "centralindia", "southeastasia" ]
    description = "The regions where our app will be deployed"
}