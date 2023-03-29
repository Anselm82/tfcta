module "s3_module" {
    source = "github.com/Anselm82/aws_s3_module//s3_bucket"
    versioning = true
    bucket_name = "${var.project}-${var.company}-${var.environment}-${var.lab_number}"
}

