class cis::grub {

  file { '/boot/grub2/grub.cfg':
    owner => 'root',
    group => 'root',
    mode  => '0640',
  }


}
