variable "filename" {
 default="/tmp/temp.txt"
 type = "string" 
 description = "Deployment File Name "
}

variable "replicas" {
 default="1"
 type = "number" 
 description = "Gives the Number of Replicas"
}
variable "isLocal"{
   default ="true"
   type = "bool"
   description = "Example of Boolean"
} 
