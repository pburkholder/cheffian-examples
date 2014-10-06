require 'json'

def current_path
  File.dirname(__FILE__)
end

def duty_of(duty='appserver')
  duties=JSON.parse(File.read(File.join(current_path, 'JSON')))
  return duties[duty]
end

def expander(hash)
  s = StringIO.new()
  hash.each(k,v) do
    s.puts("#{k}: {v}")
  end
  s
end
