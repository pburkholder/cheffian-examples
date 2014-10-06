QUESTION: Where does one store a static data structure, as in the following use case?

A customer needs to build a templated configuration file from a `global_config` YAML or JSON data source where particular node 'duties' were associated with sets of configuration values, such as the following:

```javascript
{
  "appserver": {
    "what": "app",
    "bar": "none"
  },
  "webserver": {
    "what": "web",
    "bar": "all"
  }
}
```

where the data file could be ingested as a data structure and used logically within a recipe:

```ruby
template '/etc/foo' do
  source 'foo.erb'
  variables data: fetch_data(node['duty'])
end
```

So, to the question at hand, *where does one store the JSON data?*

ANSWERS: There are four ways to feed data into a Chef cookbook recipe, each with their following use cases:

1. From a cookbook attribute: This is probably the go-to answer for most Chef coders, but attributes should only be used as an API into the cookbook. If we don't want these data to change at the role or environment level, then we shouldn't use an attribute.
1. From a data bag: Data bags are global, and not subject to the vagaries of attribute precedence levels, but they're also unversioned and don't leave an audit trail.
1. From code internal to the cookbook: *This is my preference here, since the data are tied closely to the functionality of the cookbook, and we have the VCS and Chef versioning tools to track changes to these data.*
1. From an Ohai plugin on the node: If the data were being pulled from a database or other external source, this would also be a feasible option.

EXAMPLE: This cookbook demonstrates storing the data in libraries/data.json, and accessed with a helper function. This results in a clean interface to the data, readable recipes, and a single point of change for these data.
