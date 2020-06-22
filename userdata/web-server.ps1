# PowerShell file kicking off the web server puppet module

Write-Host "###### STARTING WEB SERVER CONFIGURATION ######"

# execute puppet module
puppet apply --modulepath=C:\modules\ -e "include puppet_web_server"

Write-Host "###### WEB SERVER CONFIGURATION COMPLETE ######"