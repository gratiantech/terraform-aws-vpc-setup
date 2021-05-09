output "VPC_id" {
  value = "${aws_vpc.vpc.id}"
}

output "VPC_security_group_id" {
  value = ["${aws_security_group.VPC-SG.id}"]
}

output "public_subnets_id" {
  value = ["${aws_subnet.public_subnet.*.id}"]
}

output "private_subnets_id" {
  value = ["${aws_subnet.private_subnet.*.id}"]
}

output "public_route_table" {
  value = "${aws_route_table.public.id}"
}

output "private_route_table" {
  value = "${aws_route_table.private.id}"
}

output "NAT_instance_IP_address" {
  value = "${aws_eip.nat_instance_eip.public_ip}"  
}