resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.env}-tf-state-bucket-sahu"       #string interpolation
  tags = {
    Name = "${var.env}-tf-state-bucket-sahu"
    Environment=var.env                      #making it module specific
  }
}