# aws-hardened-server-deployment-scripts

A collection of script intended to support the deployment of CIS Amazon Linux 2 on AWS. These servers are running oin an environment based on a modified version of the https://aws.amazon.com/quickstart/architecture/compliance-nist/ quickstart. 

Because these scripts are being passed as user data in an Autoscaling Group, they will be run as root. Please adjust accordingly if running manually after instance creation. 

# Configuration Scripts

cis-aws-reverse-proxy.sh - Nginx/Docker deployment script to set up reverse proxy on the Production subnet.  




# For Level 2 Compliance:

cis-aws-audit-rem.sh - Audit and remediation script intended to bring the CIS Hardened (Level 1) AMI to ~95% Level 2 compliance. This was initally created for the Amazon Linux AMI, not Amazon Linux 2.



