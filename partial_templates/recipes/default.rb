local_stuff='local variable content'
my_apps=['appserver']

template '/etc/foo' do
  source     'foo.erb'
#  variables  local_data: local_stuff
  variables  ({
    local_data: local_stuff,
    apps: my_apps
  })
end
