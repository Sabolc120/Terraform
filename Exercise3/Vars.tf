variable "region" {
  default = "us-east-1"
}

variable "zone1" {
  default = "us-east-1a"
}

variable "amiID" {
  type = map(any)
  default = {
    us-east-1 = "ami-0ecb62995f68bb549"

  }
}