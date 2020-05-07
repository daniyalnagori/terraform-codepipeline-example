# resource "aws_s3_bucket" "releases" {
#   bucket = "${var.account_name}-releases"
#   acl    = "private"                   
# }                                      

# resource "aws_s3_bucket_policy" "releases" {
#   bucket = "${aws_s3_bucket.releases.id}"
#   policy =<<POLICY
# {
#   "Id": "Policy1513880777555",
#   "Version": "2012-10-17",
#   "Statement": [
#     {
#       "Sid": "Stmt1513880773845",
#       "Action": "s3:*",
#       "Effect": "Allow",
#       "Resource": "${aws_s3_bucket.releases.arn}",
#       "Principal": {
#         "AWS": [
#           "arn:aws:iam::${var.account_id}:role/${var.app}-dev-instance-role",
#           "arn:aws:iam::${var.account_id}:role/${var.app}-prod-instance-role"
#         ]
#       }
#     }
#   ]
# }
# POLICY
# }




resource "aws_s3_bucket" "releases" {
  bucket = "${var.account_name}-releases"
}

resource "aws_s3_bucket_policy" "releases" {
  bucket = "${aws_s3_bucket.releases.id}"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "MYBUCKETPOLICY",
  "Statement": [
    {
      "Sid": "IPAllow",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "${aws_s3_bucket.releases.arn}",
      "Condition": {
         "IpAddress": {"aws:SourceIp": "8.8.8.8/32"}
      }
    }
  ]
}
POLICY
}