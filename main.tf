terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
    }
  }
}

provider "intersight" {
  apikey    = var.ApiKey
  secretkey = var.SecretKey
  endpoint  = "https://intersight.com"
}

resource "intersight_ntp_policy" "ntp_policy" {
  name        = "tf_cloud_demo_1"
  description = "Policy Created using Terraform Cloud TF_Run_2 Auto"
  enabled     = true
  ntp_servers = ["1.1.1.2", "2.2.2.5"]
  timezone    = "America/Los_Angeles"
  organization {
    object_type = "organization.Organization"
    selector    = "Name eq 'default'"
  }
  tags {
    key   = "Location"
    value = "San Jose"
  }
  tags {
    key   = "DC"
    value = "LAB"
  }
}
