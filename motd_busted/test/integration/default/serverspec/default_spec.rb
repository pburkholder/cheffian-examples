require 'serverspec'
set :backend, :exec

describe file('/etc/motd') do
  its(:content) { should match /Awesome Appliance/ }
end
