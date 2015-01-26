#
# Cookbook Name:: aws_ebs
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

include_recipe 'aws'
device = '/dev/xvdi'
mntdir = '/mnt/db'
volume_type = 'standard'

aws_ebs_volume "#{volume_type}_ebs_volume" do
  aws_access_key aws_access
  aws_secret_access_key aws_secret
  size 50
  device device
  volume_type volume_type
  action [ :create, :attach ]
end

execute "format_#{device}" do
  command 'mkfs -t ext4 ' + device
  not_if "file -s #{device} | grep ext4"
end

directory mntdir do
  owner 'root'
  group 'root'
  mode 00644
end

mount mntdir do
  device device
  fstype 'ext4'
  action [:mount, :enable]
end
