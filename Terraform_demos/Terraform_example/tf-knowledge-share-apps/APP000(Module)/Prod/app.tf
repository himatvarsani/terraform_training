#Prod Deployment
module "app002" {
  source      = "../../Module"
  app_id      = "APP002"
  environment = "Prod"
  region      = "us-east-1"
  

  private_ips = [
    "10.0.1.20",
    "10.0.2.20",
    "10.0.3.20"
  ]
}
#DEV Deployment
module "app003" {
  source      = "../../Module"
  app_id      = "APP003"
  environment = "Dev"
  region      = "us-east-2"

  private_ips = [
    "10.0.1.40",
    "10.0.2.50",
    "10.0.3.60"
  ]
}