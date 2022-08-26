variable "project_id" {
  description = "GCP project ID"
}

variable "credentials_file" {
  description = "Path to JSON file with GCP service account key"
}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-c"
}

variable "rstudio_machine_config" {
  type    = object({
                machine_type   = string
                disk_size_gb   = number
            })
}

variable "rstudio_os_image" {
    default = "ubuntu-2110-impish-v20220309"
}

variable "domain"{
  description="The domain to deploy on"
}

variable "managed_dns_zone" {
  description="The GCP managed DNS zone where we will add the new A record for the domain above"
}

variable "admin_email" {
  description="tony_cricelli@berkeley.edu"
}
