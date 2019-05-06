#!/bin/bash
#
# File: update_gd_dns_config.sh
#
# v0.9 - 190423 - aaw - adam@deluxedistributors.com
#			Initial version.
#
#Enter vaules for all variables, Latest API call requries them.
$domain="avgo.biz"                           # your domain
$type="A"                                    # Record type A, CNAME, MX, etc.
$name="03"                                   # name of record to update. Store number.
$ttl=600                                   # Time to Live min value 600
$port=1                                    # Required port, Min value 1
$weight=1                                  # Required weight, Min value 1
$key="VVXGUC8i_N5b3KwTvvWvTevT1AwZWMm"       # key for godaddy developer API - prod
$secret="N5bALQTKjsBm5dRAGDZBgj"             # secret for godaddy developer API - prod
#
#domain="your-godaddy-domain.com"            # your domain
#type="A"                                    # Record type A, CNAME, MX, etc.
#name="my-ip"                                # name of record to update. 
#ttl="600"                                   # Time to Live min value 600
#port="1"                                    # Required port, Min value 1
#weight="1"                                  # Required weight, Min value 1
#key="godaddy_developer_api_key"             # key for godaddy developer API - prod
#secret="godaddy_developer_api_secret"       # secret for godaddy developer API - prod
#EOF
