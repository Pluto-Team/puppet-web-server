# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_web_server
class puppet_web_server {

  $powershell = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NoLogo -NonInteractive'
  exec { 'Install Web Server feature':
    command => "${powershell} C:/modules/puppet_web_server/files/install-web-server.ps1",
  }
}
