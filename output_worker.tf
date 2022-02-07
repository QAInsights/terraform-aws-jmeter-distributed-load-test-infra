output "worker_public_ip" {
  description = "The public IP address assigned to the worker(s) instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = aws_instance.jmeter_worker[*].public_ip
}
output "worker_private_ip" {
  description = "The private IP address assigned to the worker(s) instance."
  value       = aws_instance.jmeter_worker[*].private_ip
}

output "worker_instance_state" {
  description = "The state of the worker(s) instance. One of: `pending`, `running`, `shutting-down`, `terminated`, `stopping`, `stopped`"
  value       = aws_instance.jmeter_worker[*].instance_state
}

output "worker_arn" {
  description = "The ARN of the worker(s) instance"
  value       = aws_instance.jmeter_worker[*].arn
}

output "worker_jmeter_version" {
  description = "JMeter version installed on the worker(s) instance"
  value       = var.jmeter_version
}
output "worker_instance_type" {
  description = "The type of instance running the controller"
  value       = aws_instance.jmeter_worker[*].instance_type
  
}

output "jmeter_plugins" {
  description = "The JMeter plugins installed on the worker(s) instance"
  value       = var.jmeter_plugins
}
  