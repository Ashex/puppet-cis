class cis::ntp {

	class { '::ntp':
	  servers   => ['0.amazon.pool.ntp.org', '1.amazon.pool.ntp.org', '2.amazon.pool.ntp.org', '3.amazon.pool.ntp.org'],
	  restrict  => [
	    'default kod nomodify notrap nopeer noquery',
	    '-6 kod nomodify notrap nopeer noquery'
	  ],
	  iburst_enable => true,
	}

}