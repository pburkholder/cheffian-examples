
data={
  'what' => 'app'
}

template '/etc/foo' do
  source 'foo.erb'
  variables data: data
end
