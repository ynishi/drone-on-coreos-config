variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
    default = "ap-northeast-1"
}
variable "aws_zone" {
    default = "ap-northeast-1c"
}

provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region     = "${var.aws_region}"
}

resource "aws_instance" "drone-core" {
    ami           = "ami-f771b591" # coreos stable 1465.7.0 https://coreos.com/os/docs/latest/booting-on-ec2.html
    instance_type = "t2.micro"
    monitoring    = true
    tags {
        Name = "drone-core"
    }
}
