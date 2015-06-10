require 'spec_helper'

describe 'motd::default' do
  # Serverspec examples can be found at
  # http://serverspec.org/resource_types.html
  it 'does something' do
    skip 'Replace this with meaningful tests'
  end

  describe file('/etc/motd') do
    its(:content) { should match /Welcome to BCUS/ }
  end
end
