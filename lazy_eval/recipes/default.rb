
file "before" do
  path node['lazy_eval']['path']
  content "Before override"
end

file "after" do
  path lazy { node['lazy_eval']['path'] }
  content "After override"
end

node.default['lazy_eval']['path']='/etc/after'
