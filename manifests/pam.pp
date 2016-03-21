class cis::pam {
	if ($::osfamily == 'Redhat') {
		pam { "Set password quality entry":
		 ensure => present,
		 service => 'system-auth',
		 type => 'password',
		 control => 'requisite',
		 module => 'pam_pwquality.so',
		 arguments => ['try_first_pass', 'local_users_only' , 'retry=3', 'authtok_type='],
		}

		pam { "Set password memory entry":
		 ensure => present,
		 service => 'system-auth',
		 type => 'password',
		 control => 'sufficient',
		 module => 'pam_unix.so',
		 arguments => 'remember=5',
		}


		pam { "Restrict su/sudo use entry":
		 ensure => present,
		 service => 'su',
		 type => 'auth',
		 control => 'required',
		 module => 'pam_wheel.so',
		 arguments => 'use_uid',
		}
	}
}