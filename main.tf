terraform {
  required_providers {
    local = {
        source = "hashicorp/local"
        version = "~> 2.4"
    }

    random ={
        source = "hashicorp/random"
        version = "~> 3.4"
    }
  }
}


provider "local"  {}

provider "random" {}


resource "random_string" "suffix"{
   length = 6
   special = false
   upper = false
   
}//generates       result = "g5h2k9"  (for example)

resource "local_file" "local_example" {
 
  filename = "${random_string.suffix.result}${var.cnt}.txt"
  content = "This is a local file content whose file name is ${random_string.suffix.result}"  
}