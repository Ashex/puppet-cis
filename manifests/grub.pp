class cis::grub ($secure_grub = $cis::params::secure_grub) inherits cis::params {
  require cis::auditd_rules

  if $secure_grub {
    $grub_secret = hiera('grub_encrpted')
    $grub_password = hiera('grub_clear')

    # Correct all kernel lines to have the needed console parameters
    augeas { "grub-set-kernel-consoles":
      context => "/files/boot/grub/menu.lst",
      changes => ["set /files/boot/grub/menu.lst/title/kernel/ audit=1",],
    }

    augeas { "Add SHA-512 password to Grub":
      context => "/files/boot/grub/menu.lst",
      changes => ["ins password after timeout", "${grub_secret}", "${grub_password}",],
      onlyif  => "match password size == 0";
    }
  }

  file { '/boot/grub2/grub.cfg':
    owner => 'root',
    group => 'root',
    mode  => '0640',
  }


}
