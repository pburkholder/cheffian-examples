# To use:
#   berks vendor
#
require 'chef/provisioning/aws_driver'

with_driver 'aws'
data_center = 'us-west-2'
vpc_name = 'pdb_docker_demo'
vpc_cidr = '172.24.0.0/16'
key_name = 'pburkholder@ec-sync-w'

default_subnet = {
  az: 'us-west-2a',
  cidr: '172.24.10.0/24'
}

# We set the static options here, the
# dynamic options are lazy evaluated below after
# the VPC has been provisioned
with_machine_options :bootstrap_options => {
  :key_name => key_name,
  :instance_type => 't1.micro',
  :associate_public_ip_address => true,
#  :virtualization_type => :hvm,
  :image_id => 'ami-9fc29baf'  # Amazon Linux AMI 2014.09.2 (PV)
}


with_data_center data_center do
  aws_vpc vpc_name do
    cidr_block vpc_cidr
  end

  aws_subnet "#{vpc_name}_default" do
    cidr_block default_subnet[:cidr]
    vpc vpc_name
    availability_zone default_subnet[:az]
  end

  # Every VPC has a default group
  aws_security_group "#{vpc_name}_default" do
    vpc_name vpc_name
    inbound_rules [
      { ports: 22, :protocol => :tcp, sources: ['0.0.0.0/0'] }
    ]
    outbound_rules [
      { ports: 0..65_535, :protocol => :tcp, destinations: ['0.0.0.0/0'] },
      { ports: 0..65_535, :protocol => :udp, destinations: ['0.0.0.0/0'] }
    ]
  end

  opts = self.current_machine_options
  machine 'docker' do
    machine_options lazy {
      opts[:bootstrap_options][:subnet] =
          data_bag_item('aws_subnet',"#{vpc_name}_default")['subnet_id']
      opts[:bootstrap_options][:security_group_ids] =
          data_bag_item("aws_security_groups", "#{vpc_name}_default")["security_group_id"]
      opts
    }
    action :allocate
  end
end

exit

# Issues:
# - Didn't use the image_id I'd specified
# - vpc drivers don't handle internet gateways or route_tables, so needed:
#    aws ec2 create-internet-gateway
# note your InternetGatewayId
#    aws ec2 attach-internet-gateway --internet-gateway-id igw-a26abec7 --vpc-id vpc-4457fe21
# should be true
#    aws ec2 describe-route-tables
# note the RouteTableId assigned to your VpcId
#    aws ec2 create-route --route-table-id rtb-c77fc8a2 --destination "0.0.0.0/0" --gateway-id igw-a26abec7

#
