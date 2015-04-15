#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package [ 'curl' 'lsof']

include_recipe 'apt::default' # ensure apt-update runs

httpd_service 'default' do
  action [:create, :start]
end
