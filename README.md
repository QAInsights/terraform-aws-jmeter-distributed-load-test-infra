# JMeter Distributed Load Testing Infrastructure on AWS using Terraform

This repo will help you to spin up an AWS EC2 instances with Java, JMeter, and JMeter Plugins for distributed load testing.

## Prerequisites

* Terraform
* AWS Console w/ IAM role

## Setup

### AWS Key Pair

* Log into AWS console
* Navigate to EC2 -> Key Pairs
* Create a new key pair w/ RSA and Private Key format (PEM)  
* Save the private key to a file in a secure location

## Usage

```hcl
module "jmeter" {
  source  = "QAInsights/jmeter/aws"
  version = "1.1.0"

  # insert the 5 required variables here

  aws_ami                      = "ami-001089eb624938d9f"
  aws_controller_instance_type = "t2.small"
  aws_key_name                 = "terraform"
  aws_worker_instance_type     = "t2.small"
  jmeter_workers_count         = 2
}
```

By default, it will spin up an `t2.small` [not a free tier] instance with `us-east-2` availability zone. Refer to the [AWS documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-types.html) for more information.

To configure other input variables, refer to the [documentation](https://registry.terraform.io/modules/QAInsights/jmeter/aws/latest?tab=inputs#optional-inputs).

To configure [outputs](outputs.tf), refer to the [documentation](https://registry.terraform.io/modules/QAInsights/jmeter/aws/latest?tab=outputs).

## Terraform Plan and Apply

* Run `terraform init`
* Run `terraform plan`
* Run `terraform apply` when prompted to continue, enter `yes` to spin up the instance

## JMeter Execution

* Collect all the IP addresses of the JMeter controller and workers. Create `outputs.tf` to store the IP addresses.
* SSH into the JMeter controller and run the following command to start JMeter:

```sh
jmeter -n -t apache-jmeter-5.4.3/bin/examples/CSVSample.jmx -R <worker-IP-address-1,worker-IP-address-2...> \ 
-l run1.log -Dserver.rmi.ssl.disable=true
```

## JMeter validation

ssh into the instance using the PEM and run `jmeter -v` to verify JMeter is installed and working.

## Reference

* [Terraform](https://www.terraform.io/)
* [AWS](http://aws.amazon.com/)
* [Apache JMeter](https://jmeter.apache.org/)
