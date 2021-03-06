require 'json'

def json_path(json_file='../files/data.json')
  File.join(File.dirname(__FILE__), json_file)
end

def fetch_data(duty='appserver', json='../files/data.json')
  duties=JSON.parse(File.read(json_path(json)))
  return duties[duty]
end
