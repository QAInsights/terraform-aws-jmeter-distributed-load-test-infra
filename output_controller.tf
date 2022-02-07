output "controller_public_ip" {
  description = "The public IP address assigned to the controller instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = aws_instance.jmeter_main[0].public_ip
}
output "controller_private_ip" {
  description = "The private IP address assigned to the controller instance."
  value       = aws_instance.jmeter_main[0].private_ip
}

output "controller_state" {
  description = "The state of the controller instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.jmeter_main[0].instance_state
}

output "controller_arn" {
  description = "The ARN of the controller instance"
  value       = aws_instance.jmeter_main[0].arn
}

output "controller_jmeter_version" {
  description = "JMeter version installed on the controller instance"
  value       = var.jmeter_version
}

output "controller_instance_type" {
  description = "The type of instance running the controller"
  value       = aws_instance.jmeter_main[0].instance_type
  
}