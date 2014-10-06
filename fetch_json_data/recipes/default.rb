template '/etc/foo' do
  source 'foo.erb'
  variables data: fetch_data(node['duty'])
end
