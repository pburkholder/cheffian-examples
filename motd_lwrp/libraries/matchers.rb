
def create_motd(resource_name)
  ChefSpec::Matchers::ResourceMatcher.new(:motd_motd, :create, resource_name)
end
