Write-Host "#### INSTALLING POWERSHELL 7"
choco install -y powershell-core

Write-Host "#### INSTALLING .NET CORE 3.1"
choco install -y dotnetcore-sdk

Write-Host "#### INSTALLING dotnet core webhosting"
choco install -y dotnetcore-windowshosting

Write-Host "#### INSTALLING URL REWRITE"
choco install -y urlrewrite

Write-Host "#### INSTALLING JQ"
choco install -y jq

Write-Host "#### INSTALLING NOTEPAD PLUS PLUS"
choco install -y notepadplusplus
