def whyrun_supported?
  true
end

use_inline_resources

action :greet do
  message = "#{new_resource.greeting} and #{new_resource.bootproto}"
  log "greet" do
    message message
    action :write
    new_resource.updated_by_last_action(true)
  end
end

def test
  true
end
