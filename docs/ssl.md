The last issue I had in my notes form Thursday regarded how to manage SSL. I'll keep this very high-level pending more questions or specifics.


First, you'll want your clients to be able to validate the server certificates. Since you have your own CA, you'll probably want to add that CA as part of a 'base' cookbook that is included on all nodes. Creating the CA file under /etc/pki and the appropriate symlinks should be within your Chef skills, but ask if you have any issues.

Second, you mentioned that you'd want the server to validate client certs. That becomes very implementation-specific on how you intend to generate and distribute client certificates. If you have questions on how Chef would handle part of that process, please let me know.

Regards,

Peter
