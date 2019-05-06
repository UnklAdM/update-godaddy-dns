<#

This script was originally forked from https://github.com/markafox/GoDaddy_Powershell_DDNS and heavily modified for 
my own internal use. This works great for me. Your mileage may vary.

#>
<#
This script is used to check and update your GoDaddy DNS server to the IP address of your current internet connection.

First go to GoDaddy developer site to create a developer account and get your key and secret

https://developer.godaddy.com/getstarted
 
Update the first 4 varriables with your information
 
#>
# This data is now in the include file
#$domain = 'your.domain.to.update'  # your domain
#$name = 'name_of_host' #name of the A record to update
#$key = 'key' #key for godaddy developer API
#$secret = 'Secret' #Secret for godday developer API
. .\update_gd_dns_cfg.ps1
$headers = @{}
$headers["Authorization"] = 'sso-key ' + $key + ':' + $secret
$result = Invoke-WebRequest https://api.godaddy.com/v1/domains/$domain/records/$type/$name -method get -headers $headers -UseBasicParsing
$content = ConvertFrom-Json $result.content
$dnsIp = $content.data
# Get public ip address there are several websites that can do this.
$currentIp = Invoke-RestMethod http://ipinfo.io/json | Select-Object -ExpandProperty ip
echo "CurrentIP: $currentIp"
if ( $currentIp -ne $dnsIp ) {
    $Request = @(@{data=$currentIp;port=$port;priority=0;protocol="string";service="string";ttl=$ttl;weight=$weight })
    $JSON = Convertto-Json $request
    $result = Invoke-WebRequest https://api.godaddy.com/v1/domains/$domain/records/$type/$name -method put -headers $headers -Body $json -ContentType "application/json" -UseBasicParsing
}
if ( $currentIp -eq $dnsIp ) {
    echo "IP's are equal, no update required"
}
#EOF