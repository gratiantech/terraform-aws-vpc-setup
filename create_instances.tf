# get the latest ubuntu AMI
data "aws_ami" "ubuntu_latest" {
    most_recent = true
    owners = ["${var.ubuntu_owner}"]

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-focal-*"]
    }

    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }

    filter {
        name = "state"
        values = ["available"]
    }
}
# Create the NAT instance in the public subnet
resource "aws_instance" "NAT_instance" {
    ami               = "${data.aws_ami.ubuntu_latest.id}"
    instance_type     = "${var.nat_instance_type}"
    subnet_id         = "${element(aws_subnet.public_subnet.*.id, 1)}"
    
    tags = {
        Name = "${var.environment}-NAT_instance"
    }
}

# Generate elastic IP for NAT instance
resource "aws_eip" "nat_instance_eip" {
  vpc        = true
  depends_on = [aws_instance.NAT_instance]

  tags = {
        Name = "${var.environment}-NAT_instance"
    }
}

# Assign the elastic IP to the NAT instance
resource "aws_eip_association" "eip_associate" {
  instance_id   = "${aws_instance.NAT_instance.id}"
  allocation_id = "${aws_eip.nat_instance_eip.id}"
  depends_on = [aws_eip.nat_instance_eip]
}

# Create the application server in the private subnet
resource "aws_instance" "app_instance" {
    ami               = "${data.aws_ami.ubuntu_latest.id}"
    instance_type     = "${var.app_instance_type}"
    subnet_id         = "${element(aws_subnet.private_subnet.*.id, 1)}"

    tags = {
        Name = "${var.environment}-app_instance"
    }

}