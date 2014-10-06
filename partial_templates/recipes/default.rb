local_stuff='local variable content'
apps=['appserver']

template '/etc/foo' do
  source     'foo.erb'
  variables  local_data: local_stuff
  #, apps: apps
end
