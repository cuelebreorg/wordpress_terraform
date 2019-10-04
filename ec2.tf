##Lookup AMI

data "aws_ami" "ubuntu_ami" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm/ubuntu-trusty-14.04-amd64-server-20190514"]
  }
}

data "template_file" "bootstrap" {
  template = file("bootstrap.tpl")
  vars = {
    dbhost = aws_db_instance.wpdb.address
    efsid  = aws_efs_file_system.wordpressfs.id
  }
}

