# policyfiles

TODO: Demonstrate use of policyfiles to emulate build number

## Chef Server setup

No recipe for this yet. DNS is chefserver.cheffian.com. To do:

- install chef-server 12.0.7 per https://www.chef.io/blog/2015/03/27/chef-server-12-0-7-released/
- `/etc/opscode/chef-server.rb` (you need to run chef-server-ctl reconfigure to make it take effect):

    lb["xdl_defaults"]["policies"] = true
    api_fqdn 'chefserver.cheffian.com'

- create a user and an organization with that user associated (`-a`):
    sudo chef-server-ctl user-create pdb Peter Burkholder pburkholder@chef.io TestPassword -f pdb.pem
    sudo chef-server-ctl org-create pdb_org pdb_org -f pdb_org.pem -a pdb

## Scenario

We assume some build process that bundles a Chef cookbook as the generated artifact, and then includes that cookbook in the run_list of nodes in the same env:

    run_list: 'recipe[base@0.1.0], recipe[myapp@0.1.0]'

However, the myapp recipe configure index.html via a template to render the build number as well:

   <h1>Welcome to myapp</h1>
   <ul>
     <li>Version: 0.1.0</li>
     <li>Build: 1001</li>
   </ul>
