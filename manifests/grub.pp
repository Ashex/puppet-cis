class cis::grub {

  file { '/boot/grub2/grub.cfg':
    owner => 'root',
    group => 'root',
    mode  => '0640',
  }

  shellvar { "GRUB_CMDLINE_LINUX":
	  ensure       => present,
	  target       => "/etc/default/grub",
	  value        => "audit=1",
	  array_append => true,
	  require 	   => Class['cis::auditd_rules'],
	  notify       => Exec['grub-update'],
	}

  exec { 'grub-update':
	  refreshonly => true,
	  command 	  => '/sbin/grub2-mkconfig -o /boot/grub2/grub.cfg',
      require     => Package['grub2-tools-install'],
	}

package {'grub2-tools-install':
    name => 'grub2-tools',
    ensure => installed,
  }

}
