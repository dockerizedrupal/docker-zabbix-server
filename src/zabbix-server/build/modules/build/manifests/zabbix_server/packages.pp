class build::zabbix_server::packages {
  file { '/tmp/zabbix-release_2.2-1+wheezy_all.deb':
    ensure => present,
    source => 'puppet:///modules/build/tmp/zabbix-release_2.2-1+wheezy_all.deb'
  }

  bash_exec { 'cd /tmp && dpkg -i zabbix-release_2.2-1+wheezy_all.deb':
    require => File['/tmp/zabbix-release_2.2-1+wheezy_all.deb']
  }

  bash_exec { 'apt-get update':
    require => Bash_exec['cd /tmp && dpkg -i zabbix-release_2.2-1+wheezy_all.deb']
  }

  package {[
      'zabbix-server-mysql',
      'mysql-client'
    ]:
    ensure => present,
    require => Bash_exec['apt-get update']
  }
}
