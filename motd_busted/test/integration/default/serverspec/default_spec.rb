require 'serverspec'
set :backend, :exec

describe file('/etc/motd') do
  # how do I determine if it has the right content?
end
