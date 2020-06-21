# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_web_server
class puppet_web_server {

  $powershell = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NoLogo -NonInteractive'

  exec { 'change time zones':
    command   => "${powershell} C:/modules/puppet_web_server/files/change-time-zone.ps1",
    logoutput => true,
  }

  exec { 'add server dependencies':
    command   => "${powershell} C:/modules/puppet_web_server/files/install-web-server-dependecies.ps1",
    logoutput => true,
  }

  exec { 'Install Web Server feature':
    command   => "${powershell} C:/modules/puppet_web_server/files/install-web-server.ps1",
    logoutput => true,
  }

  exec { 'add Server Target group':
    command   => "${powershell} C:/modules/puppet_web_server/files/add-server-to-target-group.ps1",
    logoutput => true,
  }

  exec { 'Deploy app to IIS':
    command   => "${powershell} C:/modules/puppet_web_server/files/deploy-app-to-IIS.ps1",
    logoutput => true,
  }
}
