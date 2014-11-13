QUESTION: How to get started with testing

This assumed you have ChefDK 0.3.0 or higher installed

EXAMPLE: Run 'rake', then fix each of the offense, and compare to `motd_fixed`

If you can,
* install VirtualBox from https://www.virtualbox.org/wiki/Downloads
* install Vagrant from https://www.vagrantup.com/downloads.html

Now:
1. run `kitchen converge`, then `kitchen verify`
2. fix issues
3. repeat at 1. until no issues


DISCUSSION: Why does Rakefile use shell commands instead of Ruby tasks?

So beginners try each of the commands in isolation, e.g.:

```shell
rubocop
rspec
foodcritic .
```
