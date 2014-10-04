I got a rather inscrutable message yesterday that Bridgewater will have 400 nodes with custom Splunk configurations. I suspect that they mean that 400 nodes will need to have $SPLUNK_HOME/etc/system/default/inputs.conf configured with custom input stanzas, e.g.:

```
[monitor:///some/path/to/appA/log/file]
sourcetype = access_common
ignoreOlderThan = 7d
```

Or:
```
[monitor:///some/path/to/appB/log/file]
host_segment = 3
```



I would suggest that for users getting started, they build the custom section of inputs.conf from a hash that each app cookbook could add keys for, e.g.:

```ruby
# cookbooks/appA/attributes/default.rb

default['bwater_splunk']['custom_inputs']['appA'] = %Q(
[monitor:///some/path/to/appA/log/file]
sourcetype = access_common
ignoreOlderThan = 7d
)
```

```ruby
# cookbooks/appB/attributes/default.rb
default['bwater_splunk']['custom_inputs']['appB'] = %Q(
[monitor:///some/path/to/appB/log/file]
host_segment = 3
)
```

Then the `bwater_splunk::client` recipe would have the template for `inputs.conf` that would unpack the `node['bwater_splunk']['custom_inputs']` hash.

Or would there be another approach that would work better for getting started users?

P.
