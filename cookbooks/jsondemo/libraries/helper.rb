require 'json'
def duty_of(duty='appserver')
  duties=JSON.parse(File.read('/Users/peterchef/Projects/bwater-cse/cookbooks/jsondemo/libraries/JSON'))
  return duties[duty]
end

def expander(hash)
  s = StringIO.new()
  hash.each(k,v) do
    s.puts("#{k}: {v}")
  end
  s
end
