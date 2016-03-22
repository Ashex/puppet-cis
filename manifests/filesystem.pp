class cis::filesystem {

	mountpoint { '/tmp':
		remounts => true,
		ensure => present,
		require => mounttab['/tmp']
	}

	mountpoint { '/var/tmp':
		remounts => true,
		ensure => present,
		require => mounttab['/var/tmp']
	}

	mountpoint { '/dev/shm':
		remounts => true,
		ensure => present,
		require => mounttab['/dev/shm']
	}

	mounttab { '/tmp':
		device 	=> 'tmpfs',
		options => ['nodev','nosuid','noexec'],
		ensure 	=> present,
		fstype 	=> tmpfs
	}

	mounttab { '/var/tmp':
		require => mounttab['/tmp'],
		device 	=> '/tmp',
		options => 'bind',
		ensure 	=> present,
		fstype 	=> none
	}

	mounttab { '/dev/shm':
		device 	=> 'tmpfs',
		options => ['nosuid','nodev','seclabel', 'rw', 'noexec'],
		ensure 	=> present,
		fstype 	=> tmpfs
	}

}