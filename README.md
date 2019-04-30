# update-godaddy-dns
Command line tool for manipulating godaddy custom dns.

### Reason:

One of our affilate companies at work had texted me and asked if I had a 
DynDNS entry for one of our locations. Unfortunately I did not. The router 
at this location was not company owned and I had no login.

After deternining the IP and sending it to the appropriate person, a quick 
google for custom godaddy dns came up with this link.

https://www.godaddy.com/community/Managing-Domains/Updating-DNS-Records-via-GoDaddy-API/td-p/124154

And with a little searching I've found this to probably be the original source to this code.

https://github.com/markafox/GoDaddy_Powershell_DDNS

Needing to easily share this code with others, I've created my first GitHub project.


So here is my somewhat modified version. Feel free to contribute.

### Setup and installation:

Go [Here](https://developer.godaddy.com/getstarted) to get your GoDaddy key and secret.

Rename the file update_gd_dns_cfg_sample.sh to update_gd_dns_cfg.sh then 
edit the file for your desired configuration. Alternatively, you can add 
the variables directly to update_gd_dns.sh. 

See the source code for details.

### Files:
```
update_gd_dns.sh                - Main script.
update_gd_dns_cfg_sample.sh     - Sample config file.
xUpdateDNS.sh                   - Simple wrapper makes it pretty.
README.md                       - This file.
```

UnklAdM
