require 'serverspec'
set :backend, :exec

describe file('/etc/motd') do
  its(:content) { should match(/Property of Awesome Appliance/) }
end
