#
# Cookbook Name:: aws_ebs
# Recipe:: default
#
# Copyright (c) 2014 The Authors, All Rights Reserved.

require 'chef/provisioning'

with_machine_options :bootstrap_options => {
  :key_name => 'pburkholder@ec-sync-w',
  #:key_name => 'pburkholder@ec-metal',
}

machine 'aws_ebs' do
  recipe 'aws_ebs::ebs'
  recipe 'aws_ebs::ssd'
end
