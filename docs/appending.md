Good morning,

Hasan had asked: What’s the best way of appending to a file? (Background:  splunk nodes have server.conf file. They are are almost same. There is only few lines of difference. Currently we have server.conf.erb template file for each type of splunk node )

There's more than one way to do this. To minimize duplicating code, and to keep your code easy to follow, I would suggest using just one template and using some logic within the template to expose the lines that are relevant. While you could append or include files, the following approach keeps your source code tidier than having multiple configuration files that are merged together.

Since I don't know the particulars, for this example we'll assume you have this in `attributes/default.rb`:


```ruby

# valid splunk roes are: role_A, role_B, and or role_C
default['bwater_splunk']['splunk_role'] = 'role_A'
```


and then a `template` resource in, say, `recipes/client.rb`:

```ruby

template '/opt/splunk/some/path/to/server.conf' do
  source 'server.conf.erb'
end
```

Finally, let's use some Ruby to include lines based on the value of `node['bwater_splunk']['splunk_role']` in `templates/default/server.conf.erb`:

```
# This is some boilerplate
# this is common to all server.conf files:

common_1='a'
common_b='2'

# Below follows splunk-role specific settings:

<% if node['bwater_splunk']['slunk_role'] == 'role_A' -%>
# These lines are included only if the 'if' statement above is true
role_A settings
<% end -%>

<% if node['bwater_splunk']['slunk_role'] == 'role_B' -%>
# These lines are included only if the 'if' statement above is true
role_B settings
<% end -%>
```

If this approach seems like a poor fit to your use case, tell me more and we can reason our way to an approach that works better for you.

Lastly, caveat emptor! - I have NOT tested the above code. If it doesn't work, I may have made a mistake.

Cheers,

Peter

---

Variables are absolutely an appropriate use here. To modify the pseudo-code I presented earlier, `recipes/client.rb`:

```ruby

my_config = ''
if node['bwater_splunk']['slunk_role'] == 'role_A'
  my_config = %Q(
    # role_A configuration
    role_A settings
  )
end

if node['bwater_splunk']['slunk_role'] == 'role_B'
  my_config = %Q(
    # role_B configuration
    role_B settings
  )
end

template '/opt/splunk/some/path/to/server.conf' do
  source 'server.conf.erb'
  variables( {
    :configuration => my_config
    })
end
```

And `templates/default/server.conf`:
```
# This is some boilerplate
# this is common to all server.conf files:

common_1='a'
common_b='2'

# Below follows splunk-role specific settings:
<%= @configuration %>
```
