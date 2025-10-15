# Variable Types

- string
- number
- bool
- any
- list # any values of single type | example `type = list(number)`
- set  # any values of single type but no duplicate values | example `type = set(string)`
- map  # key value pair of single type map | example `type = map(number)`
- tupple # fixed length, ordered(types) list with different type of values  | example `type = tuple([String,number,bool])`
- object # comples data structure `type = object({name = string color = string age = number food =list(string)})`

# Usage of Variable 
- If not defined then terraform apply will ask for the values of each varaibles 
- As part of the command | example  `-var "<name>=<value>"`
- As Environment variable | example `TF_VAR_<name>=<value>`
- As .tfvars or tfvars.json |
    - Automatically picked if file name is
      ```
      - terraform.tfvars
      - terraform.tfvars.json
      - *.auto.tfvars
      - *.auto.tfvars.json
      ```
    
   - Any  other name , then needs to be applied
    `--var-file <filename>.tfvars or <filename>.tfvars.json`
    Example file content   
      ```
        name1 = "value1"
        name2 = "value2"
      ``` 
## Order of picking the varaible ( last one overrides ) // `variables.tfvar` does not define the `default`
- Environment Variable `TF_VAR_`
- `terraform.tfvars`
- `*.auto.tfvars(alphabets)`
- `-var` or `-var-file` (command-line flags)

# Resources 
How to access respurce attribute ( output of one resource) `${<resource_type>.<name_of_the_resource>.<name_of_the_attribute>}`
```tf
resource "local_file" "pet-records"{
    filename= "/tmp/earth.txt"
    content = "web-server-${random_pet.server.id}"
}
resource "random_pet" "server" {
  keepers = {
    # Generate a new pet name each time we switch to a new AMI id
    ami_id = var.ami_id
  }
}
```
## Dependency 
 - Implicit Dependency
 - Explicit Dependency
```
...
 depends_on = [
  random_pet.server
]
```


  
