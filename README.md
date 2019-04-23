# update-godaddy-dns
Command line tool for manipulating godaddy custom dns.

One of our affilate companies at work had texted me and asked if I had a 
DynDNS entry for one of our locations. Unfortunately I did not. The router 
at this location was not company owned and I had no login.

After deternining the IP and sending it to the appropriate person, a quick 
google for custom godaddy dns came up with this link.

#  https://www.godaddy.com/community/Managing-Domains/Updating-DNS-Records-via-GoDaddy-API/td-p/124154

So here is my somewhat modified version. Feel free to contribute.

Setup and installation:

Rename the file update_gd_dns_cfg_sample.sh to update_gd_dns_cfg.sh then 
edit the file for your desired configuration. Alternatively, you can add 
the variables directly to update_gd_dns.sh. 

See the source code for details.

UnklAdM
