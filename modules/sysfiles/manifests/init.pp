class sysfiles {
    package { "ntp": ensure => present }
    package { "openssl": ensure => present }
    package { "openldap-clients": ensure => present }
    package { "rsyslog": ensure => present }
    package { "pam_ldap": ensure => present }
    package { "sssd": ensure => present }
    package { "lsof": ensure => present }
    package { "mlocate": ensure => present }
    package { "telnet": ensure => present }
    package { "traceroute": ensure => present }
    package { "nfs-utils": ensure => present }
    package { "autofs": ensure => present }
    package { "man": ensure => present }

    file { "/etc/resolv.conf":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/resolv.conf",
    }
    file { "/etc/hosts":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/hosts",
    }
    file { "/etc/nsswitch.conf":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/nsswitch.conf",
    }
    file { "/etc/ntp.conf":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/ntp.conf",
    }
    file { "/etc/auto.master":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/auto.master",
    }
    file { "/etc/auto.home":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/auto.home",
    }
    file { "/etc/openldap/ldap.conf":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/ldap.conf",
    }
    file { "/etc/openldap/cacerts/ldap.conf":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/ldap.conf",
    }
    file { "/etc/sssd/sssd.conf":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "600",
        source => "puppet:///modules/sysfiles/sssd.conf",
    }
    file { "/etc/pam.d/system-auth-ac":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/system-auth-ac",
    }
    file { "/etc/pam.d/password-auth-ac":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "644",
        source => "puppet:///modules/sysfiles/password-auth-ac",
    }
    file { "/etc/sudoers.d/sudo-richkent":
        ensure => "present",
        owner => "root",
        group => "root",
        mode => "444",
        source => "puppet:///modules/sysfiles/sudo-richkent",
    }

    service { "ntpd":
        enable => "true",
        ensure => running,
        subscribe => [Package[ntp], File["/etc/ntp.conf"],],
    }
    service { "autofs":
        enable => "true",
        ensure => running,
        subscribe => [Package[autofs], File["/etc/auto.master"], File["/etc/auto.home"]],
    }
    service { "sssd":
        enable => "true",
        ensure => running,
        subscribe => [Package[sssd], File["/etc/sssd/sssd.conf"],],
    }

    service { "NetworkManager":
        enable => "false",
    }
    
}
