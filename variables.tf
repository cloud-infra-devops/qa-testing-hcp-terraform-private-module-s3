variable "region" {
  type    = string
  default = "us-west-2"
}

variable "aws_account_id" {
  description = "The AWS account ID to deploy resources"
  type        = string
  default     = "211125325120" #Put AWS Account ID
}
