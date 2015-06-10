action :create do

  file '/etc/motd' do
    content new_resource.name
  end

  new_resource.updated_by_last_action(true)
end
