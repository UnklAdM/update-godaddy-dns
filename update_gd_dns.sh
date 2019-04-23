#!/bin/bash
#
# File: update_gd_dns.sh
#
# v0.9 - 190419 - aaw - adam@deluxedistributors.com
#			Initial version. Modified from:
#  https://www.godaddy.com/community/Managing-Domains/Updating-DNS-Records-via-GoDaddy-API/td-p/124154
#
#			Added some quotes around possible empty variables. 
#			Added --insecure to curl due to old ssl code on my test server. (removed)
#			Tested for creation of new "A" records. Works good, creates new record.
#			To be used to update blah.website.ext to a proper A record resolving to the
#				current network's public IPV4 address. Use with care.
# End:
#
###Begin comments from original script.
# This script is used to check and update your GoDaddy DNS server to the IP address of your current internet connection.
# Special thanks to mfox for his ps script
# https://github.com/markafox/GoDaddy_Powershell_DDNS
#
# First go to GoDaddy developer site to create a developer account and get your key and secret
#
# https://developer.godaddy.com/getstarted
# Be aware that there are 2 types of key and secret - one for the test server and one for the production server
# Get a key and secret for the production server
#
# This script updates an a record at my-ip.your-godaddy-domain.com to your current ip address.
# If the A record doesn't exist it is created.
#

#Enter vaules for all variables, Latest API call requries them.
#
#domain="your-godaddy-domain.com"            # your domain
#type="A"                                    # Record type A, CNAME, MX, etc.
#name="my-ip"                                # name of record to update. 
#ttl="600"                                   # Time to Live min value 600
#port="1"                                    # Required port, Min value 1
#weight="1"                                  # Required weight, Min value 1
#key="godaddy_developer_api_key"             # key for godaddy developer API - prod
#secret="godaddy_developer_api_secret"       # secret for godaddy developer API - prod

# include config file. Alternatively comment this out and edit above lines.
. update_gd_dns_cfg.sh

headers="Authorization: sso-key $key:$secret"
# echo $headers

result=$(curl -s -X GET -H "$headers" \
 "https://api.godaddy.com/v1/domains/$domain/records/$type/$name")

dnsIp=$(echo $result | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
 echo "dnsIp:" $dnsIp

# Get public ip address there are several websites that can do this.
ret=$(curl -s GET "http://ipinfo.io/json")
#echo $ret
currentIp=$(echo $ret | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")
 echo "currentIp:" $currentIp

if [ "$dnsIp" != "$currentIp" ];
 then
        echo "IP's are not equal, updating record"
        curl -X PUT "https://api.godaddy.com/v1/domains/$domain/records/$type/$name" \
		-H "accept: application/json" \
		-H "Content-Type: application/json" \
		-H "$headers" \
		-d "[ { \"data\": \"$currentIp\", \"port\": $port, \"priority\": 0, \"protocol\": \"string\", \"service\": \"string\", \"ttl\": $ttl, \"weight\": $weight } ]"  
fi
if [ "$dnsIp" = "$currentIp" ];
 then
      echo "IP's are equal, no update required"
fi
#EOF