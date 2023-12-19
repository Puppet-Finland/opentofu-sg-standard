# opentofu-sg-standard

An opinionated, standard set of rules to apply on all EC2 instances.

# Input variables

This module accepts the following input variables:

* **vpc_id**: the ID of the VPC to create this security group in
* **basename**: a prefix to add to the security group name. Allows instantiating this security group multiple times in the same VPC with different settings.
* **allow_any_from_cidr_blocks**: IPV4 CIDR blocks to allow any traffic from. Defaults all private networks, i.e. ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"].
}
* **allow_ssh_cidr_blocks**: IPv4 CIDR blocks to allow SSH in from. Defaults to "allow from anywhere".
* **allow_ssh_ipv6_cidr_blocks**: IPv6 CIDR blocks to allow SSH in from. Defaults to "allow from anywhere".

For details see [input.tf](input.tf).

# Output variables

This module outputs the following variables:

* **id**: the security group ID

See [output.tf](output.tf) for details.

# Example usage

```
module "production-sg-standard" {
  source                     = "github.com/Puppet-Finland/opentofu-sg-standard.git"
  basename                   = "production
  vpc_id                     = module.production-vpc.vpc_id
  allow_ssh_cidr_blocks      = ["0.0.0.0/0"]
  allow_ssh_ipv6_cidr_blocks = ["::/0"]
}
```
