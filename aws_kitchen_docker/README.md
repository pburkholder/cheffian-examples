# aws_kitchen_docker

TODO: Enter the cookbook description here.


AMI SEARCH: https://us-west-2.console.aws.amazon.com/ec2/v2/home?region=us-west-2#Images:visibility=public-images;ownerAlias=137112412989;rootDeviceType=ebs;virtualizationType=paravirtual;search=2014.09.2;sort=name


[2015-02-13T08:55:46-05:00] ERROR: machine[docker] (aws_kitchen_docker::aws_vpc line 53) had an error: ArgumentError: unexpected option virtualization_type


[2015-02-13T09:03:09-05:00] ERROR: machine[docker] (aws_kitchen_docker::aws_vpc line 53) had an error: AWS::EC2::Errors::InvalidParameterCombination: Virtualization type 'hvm' is required for instances of type 't2.micro'.


aws ec2 create-internet-gateway
# note your InternetGatewayId
aws ec2 attach-internet-gateway --internet-gateway-id igw-myigwid --vpc-id vpc-myvpcid
# should be true
aws ec2 describe-route-tables
# note the RouteTableId assigned to your VpcId
aws ec2 create-route --route-table-id rtb-c77fc8a2 --destination "0.0.0.0/0" --gateway-id igw-a26abec7



AMI ID
ami-dfc39aef
AMI Name
amzn-ami-hvm-2014.09.2.x86_64-ebs
Owner
137112412989
Source
amazon/amzn-ami-hvm-2014.09.2.x86_64-ebs
Status
available
State Reason
-
Platform
Amazon Linux
Architecture
x86_64
Image Type
machine
Virtualization type
hvm
Description
Amazon Linux AMI 2014.09.2 x86_64 HVM EBS
Root Device Name
/dev/xvda
Root Device Type
ebs
RAM disk ID
-
Kernel ID
-
Product Codes
-
