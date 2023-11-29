output "instance_ip" {
  # <resource i.e. aws_instance>.<resource name>.<attribute reference-check terraform website>
  value = aws_instance.web.public_ip
}

output "vpc" {
    value = aws_vpc.main
}

/* AWS Instance - Count =2
output "instance" {
    value = aws_instance.web[*].public_ip 
}

output "instance" {
    value = for instance in aws_instance.web : instance.public_ip]
}
*/

/* AWS Instance - For Each
output "foo" {
    value = aws_instance.web["prod"].public_ip 
}
*/
