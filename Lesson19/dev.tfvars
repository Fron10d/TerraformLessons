region                     = "ca-central-1"
instance_type              = "t2.micro"
enable_detailed_monitoring = false

allow_ports = ["80", "22", "8080"]

common_tags = {
  Owner       = "Maks"
  Project     = "One"
  CostCenter  = "1"
  Environment = "dev"
}
