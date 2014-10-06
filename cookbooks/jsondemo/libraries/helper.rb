require 'json'

def json_path(json_file='JSON')
  File.join(File.dirname(__FILE__), json_file)
end

def fetch_data(duty='appserver')
  duties=JSON.parse(File.read(json_path))
  return duties[duty]
end
