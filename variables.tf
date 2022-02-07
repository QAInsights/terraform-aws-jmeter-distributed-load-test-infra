variable "aws_profile" {
  default = "default"
}

variable "aws_region" {
  default = "us-east-2"
}
variable "aws_ami" {
  description = "ID of AMI to use for the instance"
  type        = string
  default     = null
  validation {
    condition     = length(var.aws_ami) > 4 && substr(var.aws_ami, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
variable "aws_controller_instance_type" {
  description = "The type of controller instance to start"
  type        = string
  default     = null
}
variable "aws_worker_instance_type" {
  description = "The type of worker instance(s) to start"
  type        = string
  default     = null
}
variable "aws_key_name" {
  description = "Key name of the Key Pair to use for the instance; which can be managed using the `aws_key_pair` resource"
  type        = string
  default     = null
}

variable "jmeter_home" {
  description = "The location of the home directory"
  type        = string
  default     = "/home/ec2-user"
}

variable "jmeter_version" {
  description = "The version of JMeter to install"
  default     = "5.4.3"
  type        = string
}

variable "jmeter_plugins" {
  type        = list(string)
  description = "List of JMeter plugins to install"
  default     = null
  
}

variable "jmeter_cmdrunner_version" {
  description = "The version of JMeter CommandRunner to install"
  default     = "2.2"
  type        = string
}
variable "jmeter_plugins_manager_version" {
  description = "The version of JMeter Plugins Manager to install"
  type        = string
  default     = "1.7"
}
variable "jmeter_mode" {
  description = "The mode of JMeter to run: leader or follower"
  default     = "follower"
  type        = string

}
variable "jmeter_workers_count" {
  description = "The number of worker nodes to run"
  default     = 1
  type        = number

  validation {
    condition     = (var.jmeter_workers_count) >= 1
    error_message = "The number of worker nodes must be greater than 0."
  }
}
variable "jmeter_main_count" {
  description = "The leader/controller node must be 1."
  default     = 1
  type        = number

  validation {
    condition     = var.jmeter_main_count == 1
    error_message = "The leader/controller node must be 1."
  }
} 