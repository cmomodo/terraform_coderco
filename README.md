# CoderCo Terraform Infrastructure

This Terraform project provisions AWS infrastructure including a VPC, subnet, internet gateway, EC2 instance, and security group.

## Infrastructure Components

### VPC Configuration
- **VPC**: Custom VPC with CIDR block `10.0.0.0/16`
- **Subnet**: Main subnet with CIDR block `10.0.2.0/24`
- **Internet Gateway**: Provides internet connectivity for the VPC

### EC2 Instance
- **Instance Type**: t3.micro
- **AMI**: ami-068c0051b15cdb816
- **User Data**: Cloud-init configuration from `user_data/cloud_init.yaml`
- **Name**: coderco-instance

### Security Group
- **Name**: allow_tls
- **Ingress Rule**: Allows TLS traffic (port 443) from within the VPC CIDR block

### Outputs
- **coderco_vpc**: Public IP address of the EC2 instance

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) (version 1.0+)
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- AWS account with necessary permissions

## AWS Provider

This project uses AWS provider version `~> 6.0` and is configured for the `us-east-1` region.

## Usage

### Initialize Terraform

```bash
terraform init
```

### Plan Infrastructure

```bash
terraform plan
```

### Apply Infrastructure

```bash
terraform apply
```

### Destroy Infrastructure

```bash
terraform destroy
```

## Project Structure

```
.
├── aws.tf          # AWS provider configuration
├── vpc.tf          # VPC, subnet, and internet gateway resources
├── ec2.tf          # EC2 instance and security group resources
├── output.tf       # Output definitions
├── main.tf         # Main configuration file
└── user_data/      # Directory containing cloud-init configuration
    └── cloud_init.yaml
```

## Configuration Details

### Files

- **aws.tf**: Defines the AWS provider and required version
- **vpc.tf**: Creates VPC, subnet, and internet gateway
- **ec2.tf**: Provisions EC2 instance and configures security group with ingress rules
- **output.tf**: Exports the public IP of the EC2 instance
- **main.tf**: Currently empty, can be used for additional resources

## Notes

- The security group currently allows TLS traffic (port 443) only from within the VPC
- The EC2 instance uses a cloud-init configuration file for initial setup
- SSH key is commented out in the EC2 configuration

## Security Considerations

- Ensure AWS credentials are properly secured and not committed to version control
- Review security group rules before applying to production environments
- Consider enabling VPC flow logs for network monitoring
- Review and restrict IAM permissions as needed

## License

This project is part of CoderCo infrastructure assignments.
