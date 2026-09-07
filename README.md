# AWS Nginx Web Server with Terraform

A modular Infrastructure as Code (IaC) project using Terraform to provision an EC2 web server running Nginx on AWS.

## Project Structure

* `providers.tf` - Configures the AWS provider and required version constraints.
* `variables.tf` - Defines input variables (region, instance type, server tags).
* `data-linux.tf` - Dynamically fetches the latest official Amazon Linux 2023 AMI ID.
* `main.tf` - Provisions the AWS Security Group (Port 80) and EC2 instance with user data bootstrapping.
* `outputs.tf` - Outputs the public web address (`http://<EC2-PUBLIC-IP>`) after deployment.

---

## Architecture Overview

```text
+-----------------------------------------------------------+
| AWS Cloud (ap-southeast-1)                                |
|                                                           |
|  +-----------------------------------------------------+  |
|  | Security Group (Port 80 Allowed)                     |  |
|  |                                                     |  |
|  |   +---------------------------------------------+   |  |
|  |   | EC2 Instance (t3.micro - Amazon Linux 2023) |   |  |
|  |   |                                             |   |  |
|  |   |   +-------------------------------------+   |   |  |
|  |   |   | Automated User Data Bootstrap:       |   |   |  |
|  |   |   | Installs & Starts Nginx Web Server  |   |   |  |
|  |   |   +-------------------------------------+   |   |  |
|  |   +---------------------------------------------+   |  |
|  +-----------------------------------------------------+  |
+-----------------------------------------------------------+

**Prerequisites**
Terraform CLI installed locally.

AWS CLI installed and configured with appropriate permissions.

1. Authenticate AWS
aws configure

2. Initialize Terraform
terraform init

3. Review Plan
terraform plan

4. Deploy Infrastructure
terraform apply -auto-approve

Once deployment completes, copy the url from the terminal outputs and open it in your browser.


**Cleanup**
To destroy all managed infrastructure and prevent unwanted AWS charges:
terraform destroy -auto-approve
