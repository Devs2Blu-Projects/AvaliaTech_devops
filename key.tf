resource "aws_key_pair" "keypair_avaliatech" {
  key_name   = "keypair_avaliatech"
  public_key = "${file("~/.ssh/id_rsa.pub")}"

}