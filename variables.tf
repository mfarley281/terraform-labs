variable "loc" {
    description = "Default Azure region"
    default     = "southeastasia"
}

variable "tags" {
    default     = {
        source  = "citadel"
        env     = "training"
    }
}