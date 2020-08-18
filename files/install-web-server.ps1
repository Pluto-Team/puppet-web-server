Write-Host "##### INSTALLING WEB SERVER ROLE #####"
Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools -Verbose