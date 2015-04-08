#
# Cookbook Name:: attribute
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

# require 'pry'
# binding.pry

template '/etc/config' do
  source 'config.erb'
end
