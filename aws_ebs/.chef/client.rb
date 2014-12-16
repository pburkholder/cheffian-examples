
current_dir = File.dirname(__FILE__)
my_cookbook = File.expand_path("..", current_dir)

log_level        	:info
log_location     	STDOUT

# Need this to create myself as local non-privileged chef client node:
node_name        	'workstation_macpro'

cookbook_path            [
	my_cookbook,
	File.join(my_cookbook, 'berks-cookbooks')
]

chef_repo_path 		my_cookbook
#environment	'dev'
#environment_path "#{ENV['HOME']}/Projects/gce_preso/environments"
