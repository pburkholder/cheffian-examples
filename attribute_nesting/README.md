# attribute_nesting

This cookbook demonstrates how to use `to\_hash` and `merge` to updated nested
Mashes in the Chef object.

## Question

We have a community application cookbook where in attributes/default.rb someone has written

```
default['blah']['config'] = {
 key => value,
 key1 => value1,
 key2 => value2,
 key3 => value3,
 key4 => value4,
 # and lots and lots more key value pairs
}
```

Then, we have a wrapper cookbook where in attributes/default.rb we'd like update just a few of those entries, e.g.:

```
default['blah']['config'] = {
 key => my_value,
 key4 => my_value4
 # and quite a few more such pairs
}
```
 
Which because '=' is an assignment appears to wipe out all the defaults set by the community cookbook.
 
Is there a better way to update those entries than writing tons of lines like the following over-and-over again?

```
default['blah']['config']['key'] = value
default['blah']['config']['key1'] = value1
default['blah']['config']['key2'] = value2
```
 
## Answer


The Node objects passed around for Chef attributes look like hashes but are actually 'ImmutableMashes', which are designed to be updated only through direct manipulation via Chef calls. To update a nested structure within the node object, use the `to\_hash` method to extact the portion you want, merge in your attribute changes, then update the node object, as in the following code from `attributes/default.rb`

```
my_config_hash = default['blah']['config'].to_hash

my_config.merge!(
  {
    'key' => 'my_value',
    'key4' => 'my_value4'
  }
)

default['blah']['config'] = my_config
```


