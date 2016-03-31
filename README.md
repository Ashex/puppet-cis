# Puppet CIS #


**Table of Contents**

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
4. [Usage](#usage)
5. [Requirements](#requirements)
6. [Compatibility](#compatibility)
7. [Limitations](#limitations)
8. [Development](#development)
    * [TODO](#todo)
    
## Overview ##

This is the CIS module for RHEL and Ubuntu based systems for server hardenining. 
This fork has been modified to be compliant with the CIS CentOS 7 Benchmark v1.1.0 guide (04-02-2015). As such some settings may have been removed that weren't scored or were superfluous. Additionally it's been tweaked to play nice with other modules or system updates.
One item of note is that the SSH Configuration has been removed completely, it can be handled via the saz-ssh module. An example hiera configuration is provided.


## Module Description ##

This is a fully parametarized module for hardening servers to the CIS benchmark. The parameters let you easily specify to which degree you want to harden and easily allow for exceptions. This module includes everything scored in the latest CIS benchmarks which can be found in my CIS github repo.


## Setup ##

You may need to setup a mail relay, or if your in AWS and using SES, replace the cis::mail stuff with your SES credentials and include the SES module from the forge. Other than that just see the params for all your settings. 

## Usage ##

```
include ::cis
#For SSH Configuration
include ssh::server
```

You'll need to provide the settings for SSH via hiera, the following configuration should cover the minimum requirements:

```
ssh::server::options:
 Protocol: 2
 LogLevel: INFO
 X11Forwarding: no
 MaxAuthTries: 4
 IgnoreRhosts: yes
 HostbasedAuthentication: no
 PermitRootLogin: no
 PermitEmptyPasswords: no
 PermitEmptyPasswords: no
 PermitUserEnvironment: no
 Ciphers: 'aes128-ctr,aes192-ctr,aes256-ctr'
 ClientAliveInterval: 300
 ClientAliveCountMax: 0
 Banner: /etc/issue
```

## Requirements ##

puppetlabs/stdlib >=4.6.0

puppetlabs/firewall >=1.1.3

kemra102/auditd >=1.0.2

fiddyspence/sysctl >=1.1.0

mjhas/postfix >=1.0.0

jfryman/selinux >=0.2.3

herculesteam/augeasproviders_pam>=2.1.0

erwbgy/limits>=0.3.1

puppetlabs/mount_providers>=0.0.3"

puppetlabs/ntp>=4.1.2

saz/rsyslog>=3.5.1


## Compatibility ##

  * RHEL 6,7
  * CentOS 6,7
  * Fedora 20,20,21
  * Ubuntu 12.04,14.04
  * Debian 6,7

## Limitations ##

This module has been tested on:

  - RHEL 6,7
  - Ubuntu 14.04 
  - CentOS 7

## Development ##

Any updates or contibutions are welcome.

Report any issues with current release, as any input will be considered valuable.


#### TODO ####

  * add option for postfix or ses in params
 
###### Contact ######

Email:  morgan@aspendenver.org

WWW:    www.aspendenver.org

Github: https://github.com/swizzley

