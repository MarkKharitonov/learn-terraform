provider "aws" {
    region = "us-east-2"
}

variable "user_names" {
    description = "Create IAM users with these names"
    type        = list(string)
    default     = ["neo", "trinity", "morpheus"]
}

resource "aws_iam_user" "example" {
    for_each = toset(var.user_names)
    name     = each.value
}

output "all_users" {
    value = aws_iam_user.example
}

output "all_arns" {
    value = values(aws_iam_user.example)[*].arn
}