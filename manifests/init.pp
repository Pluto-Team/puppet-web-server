# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppet_web_server
class puppet_web_server {

  $powershell = 'C:/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -NoProfile -NoLogo -NonInteractive'

  notice( '##### CHANGING TIME ZONES #####' )
  exec { 'change time zones':
    command   => "${powershell} C:/modules/puppet_web_server/files/change-time-zone.ps1",
    logoutput => true,
  }

  notice( '##### INSTALL WEB SERVER FEATURE #####' )
  exec { 'Install Web Server feature':
    command   => "${powershell} C:/modules/puppet_web_server/files/install-web-server.ps1",
    logoutput => true,
  }

  notice( '##### ADDING SERVER DEPENDENCIES #####' )
  exec { 'add server dependencies':
    command   => "${powershell} C:/modules/puppet_web_server/files/install-web-server-dependecies.ps1",
    logoutput => true,
  }

  notice( '##### ADDING SERVER ENVIRONMENT VARIABLES #####' )
  exec { 'add server environment variables':
    command   => "${powershell} C:/modules/puppet_web_server/files/setup-add-environment-variables.ps1",
    logoutput => true,
  }

  notice( '##### ADD SERVER TO TARGET GROUP #####' )
  exec { 'add Server Target group':
    command   => "${powershell} C:/modules/puppet_web_server/files/add-server-to-target-group.ps1",
    logoutput => true,
  }

  notice( '##### DEPLOY APP TO IIS #####' )
  exec { 'Deploy app to IIS':
    command   => "${powershell} C:/modules/puppet_web_server/files/deploy-app-to-IIS.ps1",
    logoutput => true,
  }

  notice( '##### INSERTING LOGGING DIRECTORY #####' )
  exec { 'Add logging directory':
    command   => "${powershell} C:/modules/puppet_web_server/files/setup-log-folder.ps1",
    logoutput => true,
  }

  file { 'C:\\inetpub\\wwwroot\\CandidateTracker\\web.config':
    ensure => 'present',
    owner  => 'Administrator',
    group  => 'Administrators',
    source => 'C:\\modules\\puppet_web_server\\files\\web.config'
  }
}
