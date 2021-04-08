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

$domain="your-godaddy-domain.com"                           # your domain
$type="A"                                    # Record type A, CNAME, MX, etc.
$name="@"                                   # name of record to update. Store number.
$ttl=600                                   # Time to Live min value 600
$port=1                                    # Required port, Min value 1
$weight=1                                  # Required weight, Min value 1
$key="godaddy_developer_api_key"       # key for godaddy developer API - prod
$secret="godaddy_developer_api_secret"             # secret for godaddy developer API - prod

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$headers = @{}
$headers["Authorization"] = 'sso-key ' + $key + ':' + $secret

$period = [timespan]::FromSeconds(45)
$lastRunTime = [DateTime]::MinValue
echo "Start to check..." 
while (1)
{
    # If the next period isn't here yet, sleep so we don't consume CPU
    while ((Get-Date) - $lastRunTime -lt $period) { 
        Start-Sleep -Milliseconds 500
    }
    $lastRunTime = Get-Date
    
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
    echo "Wait for another check..."
}

#EOF
