Write-Host "###### APPLY ENVIRONMENT VARIABLES #####"
$instanceId = ( Invoke-WebRequest -Uri http://169.254.169.254/latest/meta-data/instance-id )
 Write-Host "Instance ID -->" $instanceId
 Write-Host "#### Retrieving the server console name tag ####"
 $webServerConsoleNameTag = ( aws ec2 describe-tags --filters "Name=resource-id,Values=$instanceId" | jq -r '.Tags[0].Value' )

 Write-Host "The server console name tag is " $webServerConsoleNameTag
 if( $webServerConsoleNameTag -eq "Candidate-tracker-Dev-Web-Server" ) {
     Write-Host "###### APPLYING DEV WEB SERVER ASPNETCORE_ENVIRONMENT VARIABLE"
     [Environment]::SetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", "Dev", "Machine")
 }
 else {
    Write-Host "###### APPLYING TEST WEB SERVER ASPNETCORE_ENVIRONMENT VARIABLE"
    [Environment]::SetEnvironmentVariable("ASPNETCORE_ENVIRONMENT", "Test", "Machine")
 }

 # refreshing PATH so that the other pieces can pickup this environment variable
 $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")