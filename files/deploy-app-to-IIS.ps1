  # bring down a specific version of the application and deploy it to IIS
#Install-Module -Nam AWS.Tools.Common -Force -Verbose
# Install-Module -Name AWS.Tools.EC2 -Force -Verbose

Write-Host "##### Finding Web application package #####"
$instanceId = ( Invoke-WebRequest -Uri http://169.254.169.254/latest/meta-data/instance-id )

Write-Host "Instance ID -->" $instanceId

Write-Host "#### Retrieving the server console name tag ####"
$webServerConsoleNameTag = ( aws ec2 describe-tags --filters "Name=resource-id,Values=$instanceId" | jq -r '.Tags[0].Value' )

Write-Host "The server console name tag is " $webServerConsoleNameTag

Write-Host "#### Bringing Down the application ####"
if( $webServerConsoleNameTag -eq "Candidate-tracker-Dev-Web-Server" ) {
    Write-Host "Bringing down Dev Branch of Candidate tracker"
    aws s3 cp s3://pluto-app-artifact-store/Dev/PlutoApp-Dev/ C:\inetpub\wwwroot\CandidateTracker\ --recursive
   
   # deploy the application to IIS with the correct web config
}

else {
  Write-Host "Bringing down Test Branch of Candidate tracker"
  # bring down the most current version from the Test folder
  aws s3 cp s3://pluto-app-artifact-store/Test/PlutoApp-Dev/ C:\inetpub\wwwroot\CandidateTracker\ --recursive
} 