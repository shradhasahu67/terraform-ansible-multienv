variable "env"{
    description = "this is the env for my infra e.g. dev/prd/stg"
    type=string
}

variable "instance_count"{
    description = "this is the number of ec2 instance"
    type=number
}

variable "instance_type"{
    description = "this is the type of ec2 instance"
    type=string
}

variable "ami"{
    description = "this is the ami id of ec2 instance"
    type=string
}

variable "volume_size"{
    description = "this is the size of root EBS for ec2 instance"
    type=number
}