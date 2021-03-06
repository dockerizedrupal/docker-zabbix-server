class build::zabbix_server {
  require build::zabbix_server::packages
  require build::zabbix_server::supervisor

  include build::zabbix_server::logs

  bash_exec { 'mkdir -p /var/run/zabbix': }

  file { '/var/run/zabbix/zabbix_server.pid':
    ensure => present,
    owner => zabbix,
    group => zabbix
  }
}
