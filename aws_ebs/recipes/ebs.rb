#
# Cookbook Name:: aws_ebs
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'aws'

aws_ebs_volume "db_ebs_volume" do
  aws_access_key node['aws_ebs']['aws_access_key_id']
  aws_secret_access_key node['aws_ebs']['aws_secret_access_key']
  size 50
  device "/dev/sdi"
  action [ :create, :attach ]
end

mount '/mnt/db' do
  device 'dev/sdi'
end
