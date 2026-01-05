resource "aws_dynamodb_table" "my_table" {
    name = "${var.env}-tf-app-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "userID"                       #LockID if we set remote backend
    attribute {
      name = "userID"
      type = "S"
    }
    tags = {
      Name = "${var.env}-tf-app-table"
      Environment = var.env
    }
  
}