

resource "aws_key_pair" "deployer_key" {
  key_name   = "deployer_key"
  public_key = "yourkeyhere"

}