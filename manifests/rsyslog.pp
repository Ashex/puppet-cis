class cis::rsyslog (
    $rsyslog_server  = $cis::params::rsyslog_server,
    $rsyslog_port    = $cis::params::rsyslog_port) inherits cis::params {
    
    class{'rsyslog::client':
        log_remote => true,
        server => $rsyslog_server,
        port => $rsyslog_port
        }

  file { ['/etc/rsyslog.d/client_log.conf']:
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
    source => 'puppet:///modules/cis/rsyslog_client.conf',
  }

  file { '/var/log/messages':
    ensure => present,
    mode   => '0600',
    owner  => 'root'
  }

  file { '/var/log/kern.log':
    ensure => present,
    mode   => '0640',
    owner  => 'root'
  }

  file { '/var/log/daemon.log':
    ensure => present,
    mode   => '0600',
    owner  => 'root'
  }

  file { '/var/log/syslog':
    ensure => present,
    mode   => '0600',
    owner  => 'root'
  }

  file { '/var/log/unused.log':
    ensure => present,
    mode   => '0600',
    owner  => 'root'
  }



}