variable "project_name" {
  description = "Name of the Google Cloud project 2"
  type        = string
}

# TODO: ensure the id is unique and available
variable "project_id" {
  description = "ID of the Google Cloud project"
  type        = string
}

variable "billing_account" {
  description = "Billing account for the Google Cloud project"
  type        = string
}

variable "android_app_display_name" {
  description = "Display name of the Firebase Android app"
  type        = string
}

variable "android_app_package_name" {
  description = "Package name of the Firebase Android app"
  type        = string
}

variable "ios_app_display_name" {
  description = "Display name of the Firebase iOS app"
  type        = string
}

variable "ios_app_bundle_id" {
  description = "Bundle ID of the Firebase iOS app"
  type        = string
}

variable "web_app_display_name" {
  description = "Display name of the Firebase Web app"
  type        = string
}

variable "firebase_region_name" {
  description = "Region for the Firebase project"
  type        = string
}

variable "credentials_file" {
  description = "Path to the credentials file for the Google Cloud project"
  type        = string
}