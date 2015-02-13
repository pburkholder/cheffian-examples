current_dir = File.dirname(__FILE__)
my_cookbook = File.expand_path("..", current_dir)
cookbook_parent = File.expand_path("..", my_cookbook)
log_level        	:info
log_location     	STDOUT

# Need this to create myself as local non-privileged chef client node:
node_name        	'workstation'

# use 'berks vendor' and this cookbook path:
cookbook_path            [
	my_cookbook,
	cookbook_parent,
	File.join(my_cookbook, 'berks-cookbooks')
]

chef_repo_path 		File.join(my_cookbook, 'chef-repo')
# cache_path        File.join(my_cookbook, 'zero-cache')

cache_path		"#{ENV['HOME']}/.chef/zero/cache"

puts "#{cookbook_path}"
