template '/etc/foo' do
  source     'foo.erb'
  variables  local_data: 'local data stuff'
end
