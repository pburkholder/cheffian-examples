
my_config = default['blah']['config'].to_hash.merge(
    {
    'key' => 'my_value'
    }
)

default['blah']['config'] = my_config


