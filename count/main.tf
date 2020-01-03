provider "aws" {
    region = "us-east-2"
}

variable "user_names" {
    description = "Create IAM users with these names"
    type        = list(string)
    default     = ["neo", "trinity", "morpheus"]
}

resource "aws_iam_user" "example" {
    count = length(var.user_names)
    name  = var.user_names[count.index]
}

output "neo_arn" {
    value       = aws_iam_user.example[0].arn
    description = "The ARN for user Neo"
}

output "all_arns" {
    value       = aws_iam_user.example[*].arn
    description = "The ARNs for all users"
}