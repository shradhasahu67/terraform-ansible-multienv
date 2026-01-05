#dev-infra module
module "dev-infra"{
    source= "./infra"   #source is infra folder in the current folder present in local
    env = "dev"
    instance_count= 1
    instance_type = "t3.micro"
    ami= "ami-068c0051b15cdb816"
    volume_size= 10
}

# stg-infra module
module "stg-infra" {
    source = "./infra"
    env = "stg"
    instance_count = 2
    instance_type = "t3.small"
    ami = "ami-068c0051b15cdb816"
    volume_size = 10
}

# prd-infra module
module "prd-infra" {
    source = "./infra"
    env = "prd"
    instance_count = 2
    instance_type = "t3.micro"
    ami = "ami-068c0051b15cdb816"
    volume_size = 10
}


output "dev_infra_ec2_public_ips" {
  value = module.dev-infra.ec2_public_ips
}


output "stg_infra_ec2_public_ips" {
  value = module.stg-infra.ec2_public_ips
}


output "prd_infra_ec2_public_ips" {
  value = module.prd-infra.ec2_public_ips
}