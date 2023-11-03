# output "instance_ip" {
#   value = aws_instance.avaliatech_vm.public_ip
#   description = "O IP público da instância EC2"
# }
# output "instance_id" {
#   value = aws_instance.avaliatech_vm.id
# }
# output "instance_public_dns" {
#   value = aws_instance.avaliatech_vm.public_dns
# }

output "avaliatechback_vm_ip" {
  value       = aws_instance.avaliatechback_vm.public_ip
  description = "O IP público da instância EC2 para o backend"
}

output "avaliatechback_vm_id" {
  value = aws_instance.avaliatechback_vm.id
}

output "avaliatechback_vm_public_dns" {
  value = aws_instance.avaliatechback_vm.public_dns
}

output "avaliatechfront_vm_ip" {
  value       = aws_instance.avaliatechfront_vm.public_ip
  description = "O IP público da instância EC2 para o frontend"
}

output "avaliatechfront_vm_id" {
  value = aws_instance.avaliatechfront_vm.id
}

output "avaliatechfront_vm_public_dns" {
  value = aws_instance.avaliatechfront_vm.public_dns
}

output "avaliatechdevops_vm_ip" {
  value       = aws_instance.avaliatechdevops_vm.public_ip
  description = "O IP público da instância EC2 para o devops"
}

output "avaliatechdevops_vm_id" {
  value = aws_instance.avaliatechdevops_vm.id
}

output "avaliatechdevops_vm_public_dns" {
  value = aws_instance.avaliatechdevops_vm.public_dns
}
