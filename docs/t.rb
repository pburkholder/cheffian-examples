my_config = '' 
if node['bwater_splunk']['slunk_role'] == 'role_A'
  my_config = %Q(
    # role_A configuration
    role_A settings
  )
end
 
if node['bwater_splunk']['slunk_role'] == 'role_B'
  my_config = %Q(
    # role_B configuration
    role_B settings
  )
end
 
template '/opt/splunk/some/path/to/server.conf' do
  source 'server.conf.erb'
  variables( { 
    :configuration => my_config
    })
end
