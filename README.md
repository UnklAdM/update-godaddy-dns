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


### What happened next...

Needing to easily share this code with others, I created my first GitHub project.

I needed this to run on Windows, so now there is a PowerShell version.

This software is distributed as both a bash shell script and a PowerShell script.

Feel free to contribute.

### First do this...

Go [Here](https://developer.godaddy.com/getstarted) to get your GoDaddy key and secret.

### Setup and installation (bash):

Rename the file update_gd_dns_cfg_sample.sh to update_gd_dns_cfg.sh then 
edit the file for your desired configuration. Alternatively, you can add 
the variables directly to update_gd_dns.sh. 

### Setup and installation (windows):

Rename the file update_gd_dns_cfg_sample.ps1 to update_gd_dns_cfg.ps1 then 
edit the file for your desired configuration. Alternatively, you can add 
the variables directly to update_gd_dns.ps1. 

### Files:
```
update_gd_dns.sh                - Main script (bash).
update_gd_dns.ps1		            - Main script (PowerShell).
update_gd_dns_cfg_sample.sh     - Sample config file (bash).
update_gd_dns_cfg.sample.ps1    - Sample config file (PowerShell).
xUpdateDNS.sh                   - Simple wrapper makes it pretty (bash).
README.md                       - This file.
```

UnklAdM
