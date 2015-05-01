
actions :greet
default_action :greet

attribute :greeting, kind_of: String, name_attribute: true

attribute :bootproto, :kind_of => String, :equal_to => ['static','dhcp'], :default => 'dhcp', :required => true
