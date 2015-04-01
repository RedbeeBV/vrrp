# == Class: vrrp
#
# Full description of class vrrp here.
#
# === Examples
#
#  class { 'vrrp':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Copyright
#
# Copyright 2015 Dany Henriquez, unless otherwise noted.
#
class vrrp (
  $vrrp_instance = 'instance_01',
  $state = 'MASTER',
  $interface = 'eth0',
  $virtual_router_id = '50',
  $priority = '100',
  $advert_int = '1',
  $auth_pass = '1234567890',
  $virtual_ip = '',
  $vrrp_scripts = [],
  $notify_main = false,
  $notify_master = false,
  $notify_backup = false,
  $notify_fault = false,
  $notify_stop = false,
  $ensure = 'running',
  $enable = true,
  ) {

  package { 'keepalived':
    ensure   => installed,
  }

  file { '/etc/keepalived/keepalived.conf':
    content => template('vrrp/keepalived.erb')
  }

  service { 'keepalived':
    ensure     => $ensure,
    enable     => $enable,
    hasrestart => true,
    hasstatus  => true,
  }

}
