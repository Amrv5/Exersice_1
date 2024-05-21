#Route 53 variables
##Route 53 domain name

variable "domain_name"{
default = "amr23.com"
description= "Domain name"
type = string 
}

##Route 53 record 

variable "record_name"{
default = "www"
description= "sub domain name"
type = string 
}

