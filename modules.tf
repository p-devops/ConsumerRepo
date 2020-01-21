//--------------------------------------------------------------------
// Variables



//--------------------------------------------------------------------
// Modules
module "consumer_ec2_instance" {
  source  = "app.terraform.io/p-devops/consumer-ec2-instance/aws"
  version = "1.24.0"

  instance_count = 2
  name = "p-devops-ec2"
}

module "consumer_elb" {
  source  = "app.terraform.io/p-devops/consumer-elb/aws"
  version = "1.24.0"

  environment = "${var.environment}"
  instances = "${module.consumer_ec2_instance.id}"
  name = "p-devops-elb"
  number_of_instances = 2
}
