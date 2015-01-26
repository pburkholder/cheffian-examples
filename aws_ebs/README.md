# aws_ebs

Enter the cookbook description here.

AWS CREDENTIALS:

For provisioning:
~/.aws/config:

    [default]
    region = us-west-2
    aws_access_key_id = KEY
    aws_secret_access_key = Secret
    endpoint = https://ec2.us-west-2.amazonaws.com

For the EBS volumes:
    Update `libraries/helper` to store the keys. IAM roles are better, details to come....

SSH keys

- AWS needs your public key stored with them, try `aws ec2 create-key-pair` or `aws ec2 import-key-pair`
- Store the public key material in ~/.chef/keys
- Use the keypair name in `recipes/default.rb` and `recipes/destroy.rb`



HOW-TO:

    knife node list -z -c .chef/client.rb
    chef-client -c .chef/client.rb -r aws_ebs -z

CLEANUP:

    chef-client -c .chef/cliene.rb -r aws_ebs::destroy -z
    knife node delete aws_ebs -c .chef/client.rb -z
