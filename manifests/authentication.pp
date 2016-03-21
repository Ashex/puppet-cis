class cis::authentication (
  $lock_stale_users = $cis::params::lock_stale_users,
  $umask_user       = $cis::params::umask_user) inherits cis::params {
  file { ['/etc/passwd', '/etc/group']:
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  file { '/etc/shadow':
    owner => 'root',
    group => 'root',
    mode  => '0640',
  }

  file { ['/etc/issue', '/etc/motd']:
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/cis/banner',
  }

  file { '/etc/login.defs':
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('cis/login.defs.erb'),
  # notify  => Service['auditd'], [TODO] debug auditd module
  }

  if ($::osfamily == 'Debian') {
    file { '/etc/pam.d/common-password':
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/cis/common-password',
    }

    file { '/etc/pam.d/su':
      mode   => '0644',
      owner  => 'root',
      group  => 'root',
      source => 'puppet:///modules/cis/su',
    }
  }
}
