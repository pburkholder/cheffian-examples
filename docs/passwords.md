Hasan had asked:  What’s the best way of storing password? If I don’t remember wrong, you suggested using chef vault.

I'll assume a use case something like the following:

* Create /root/password_file on some node
* The file is ownership root:root, mode 0400
* The content is a clear-text password on the node
* The file is created by chef-client from content stored, securely, on the Chef server

And for 'securely' we'll concern ourselves with the password's confidentiality and integrity.

For this use-case, the Chef ecosystem has two approaches. First, there's the built-in Encrypted Data Bag feature, which uses AES-256 encryption of data based on a shared secret. Documentation here: https://docs.getchef.com/essentials_data_bags.html#encrypt-a-data-bag-item.  The rub here is the share-secret, namely, that you are responsible for the mechanism to distribute the key to the client. I won't discuss it further in this message.

The second approach is chef-vault, which is client-side code to help manage encrypted data bags. The code allows you to encrypt a Chef Data Bag Item using the public keys of a list of chef nodes. This allows only those chef nodes to decrypt the encrypted values. The project code lives at https://github.com/Nordstrom/chef-vault and a good introduction can be found at http://jtimberman.housepub.org/blog/2013/09/10/managing-secrets-with-chef-vault/

In a nutshell, as a Chef administrator I could create a new chef-vault item thusly:

```
echo 'SecretPassword' > passwordfile     # Create temporary password file

knife vault create splunk password \     # Create a password object in a data bag called splunk
   --mode client                 \       # Talk to the chef server rather than local
   --file passwordfile           \       # Use the passwordfile (file) we put the cleartext password in
   --search "role:splunkserver"       \  # Encrypted for all *current* nodes with the splunkserver role
   --admins "[peterb, hasan, jacques]"   # Encrypted for the admins

rm passwordfile                          # Clean up after myself
```

The chef-vault command would encrypt the contents of password file with the public keys for the list of admins, and the public keys of the nodes that match the search statement.  The passwordfile would _only be readable with the private keys_ in the possession of the admins and stored on the matching nodes.

It's a good model but assumes the nodes that match the search statement don't change often. If a new splunkserver comes on line, it won't be able to read the stored password until an administrator rekeys the chef-vault.

Since you place a premium on security I will highlight potential issues here: One could have a process that rekeys that regularly, but in that case you would need to make sure that a) the rekeying meets your security policy (do you trust a cron job with your admin keys?) and b) the rekeying is not subject to a role impersonation attack, where a malicious root user on an low-value node adds a high-value role to that node's runlist. Such an attack can be prevented or detected through auditing and alerting of any runlist changes (e.g. with Chef Analytics) and by using Chef Organizations to partition your nodes.

Regarding the password's integrity, if you're interested in chef-vault we'll need to discuss the appropriate data bag access-controls to prevent any unauthorized modifications of the vault items (even by users that can't read the items).

Best wishes,

Peter
