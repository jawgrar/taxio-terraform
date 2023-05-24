# Firebase Terraform Project

This repository contains Terraform configurations for provisioning and managing resources in Firebase.

Using Infrastructure as Code (IaC), Terraform allows us to create a reliable and repeatable process to build our Firebase applications. This ensures that our infrastructure is always in sync with our codebase and can be easily reproduced in multiple environments.

## Features

- Creates a Firebase project with specified configuration parameters.
- Enables the necessary APIs for Firebase in the Google Cloud Project.
- Creates Firebase apps (iOS, Android, Web) with specified bundle IDs/package names.
- Maintains state management and automates changes in infrastructure.

## Prerequisites

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) installed
- Google Cloud account with sufficient permissions
- Firebase Management API enabled

## Usage

1. Clone this repository
2. Modify the variable values in `variables.tf` as needed
3. Initialize Terraform

```bash
terraform init
```

4. Review the execution plan

```bash
terraform plan
```

5. Apply the configuration

```bash
terraform apply
```

## Note

Please ensure the Google Cloud account and Firebase have the necessary IAM permissions.

For more information on Terraform, visit the official [Terraform documentation](https://learn.hashicorp.com/terraform).

---

Feel free to modify it to better match your project needs.
