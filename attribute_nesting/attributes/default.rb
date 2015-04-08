
my_config = default['blah']['config'].to_hash

my_config.merge!(
    {
    'key' => 'my_value',
    'key4' => 'my_value4'
    }
)

default['blah']['config'] = my_config


