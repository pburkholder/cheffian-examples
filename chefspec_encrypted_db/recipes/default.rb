#
# Cookbook Name:: chefspec_encrypted_db
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

#db_pwd = Chef::EncryptedDataBagItem.load("pw", "mssql", Chef::EncryptedDataBagItem.load_secret("#{data_bag_item("keys", "admin")['keyfile']}"))["#{node.environment}"]["db_password"]
#db_client_pwd = Chef::EncryptedDataBagItem.load("pw", "mssql", Chef::EncryptedDataBagItem.load_secret("#{data_bag_item("keys", "admin")['keyfile']}"))["#{node.environment}"]["db_client_password"]

cleartext = 'cleartext'
simple_edb = Chef::EncryptedDataBagItem.load("simple", "edb", "secret")


nested_edb = Chef::EncryptedDataBagItem.load("nested", "edb",
    Chef::EncryptedDataBagItem.load_secret("#{data_bag_item("keys", "admin")['keyfile']}"))

#simple_edb = data_bag_item("simple", "edb", "secret")

file '/etc/cleartext' do
  content "Welcome to secret: #{cleartext}"
end

file '/etc/simple_edb' do
  content "Welcome to secret: #{simple_edb}"
end

file '/etc/nested_edb' do
  content "Welcome to secret: #{nested_edb}"
end
