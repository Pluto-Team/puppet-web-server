 # add server to target group

 Write-Host "##### ADDING SERVER TO TARGET GROUP #####"
 $targetGroupArn = ""
 
 # retrieve public IP of the server( this is required to add the server to the target group )
 
 # retrieving instance ID to get server tag info
 $instanceId = ( Invoke-WebRequest -Uri http://169.254.169.254/latest/meta-data/instance-id )
 Write-Host "Instance ID -->" $instanceId
 Write-Host "#### Retrieving the server console name tag ####"
 $webServerConsoleNameTag = ( aws ec2 describe-tags --filters "Name=resource-id,Values=$instanceId" | jq -r '.Tags[0].Value' )
 
 Write-Host "The server console name tag is " $webServerConsoleNameTag
 
 Write-Host "#### Bringing Down the application ####"
 if( $webServerConsoleNameTag -eq "Candidate-tracker-Dev-Web-Server" ) {
 
     $targetGroupArn = "arn:aws:elasticloadbalancing:us-east-1:073247231803:targetgroup/dev-pluto-app-TG/9deed66e798a1354"
     Write-Host "Registering to target group dev-pluto-app-TG"
     Write-Host "Target group ARN ----> " $targetGroupArn
    
    # deploy the application to IIS with the correct web config
 }
 
 else {
     $targetGroupArn = "arn:aws:elasticloadbalancing:us-east-1:073247231803:targetgroup/test-pluto-app-TG/12f0156f58c67659"
     Write-Host "Registering to target group test-pluto-app-TG"
     Write-Host "Target group ARN ----> " $targetGroupArn
 }
 
 # adding server to target
 Write-Host "##### STARTINg SERVER REGISTRATION PROCESS ####"
 aws elbv2 register-targets --target-group-arn $targetGroupArn --targets Id=$instanceId 
 