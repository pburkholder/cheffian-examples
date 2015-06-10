actions :create, :delete
default_action :create

provides :motd

attribute :name, :kind_of => String, :name_attribute => true
