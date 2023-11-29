output "server_public_ip" {
    value = aws_instance.my_public_server.public_ip
  
}

output "server_p1" {
    value = aws_instance.private_1.private_ip
  
}
output "server_p2" {
    value = aws_instance.private_2.private_ip
  
}
output "server_p3" {
    value = aws_instance.private_3.private_ip
  
}
output "server_p4" {
    value = aws_instance.private_4.private_ip
  
}
output "server_p5" {
    value = aws_instance.private_5.private_ip
  
}