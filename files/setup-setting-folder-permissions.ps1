Write-Host "###### SETTING UP FOLDER PERMISSIONS #####"
$Acl = Get-Acl "C:\inetpub\wwwroot\"
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("IIS AppPool\CandidateTracker", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$Acl.SetAccessRule( $Ar )

Set-Acl "C:\inetpub\wwwroot\" $Acl -Verbose


Write-Host "Setting log folder permissions"
$Acl = Get-Acl "C:\logs\"
$Ar = New-Object System.Security.AccessControl.FileSystemAccessRule("IIS AppPool\CandidateTracker", "FullControl", "ContainerInherit,ObjectInherit", "None", "Allow")
$Acl.SetAccessRule( $Ar )

Set-Acl "C:\logs\" $Acl -Verbose