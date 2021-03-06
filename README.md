# VRRP

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Limitations - OS compatibility, etc.](#limitations)

## Overview

[![Build Status](https://travis-ci.org/RedbeeBV/vrrp.svg?branch=master)](https://travis-ci.org/RedbeeBV/vrrp)

This module will only configure simple VRRP instances.
Note : The check scripts need to be copied bij yourself or already need to exist.

## Module Description

This module will only configure simple VRRP instances.

## Usage
```puppet
class{ 'vrrp':
  vrrp_instance = 'instance_01'
  state = 'MASTER'
  interface = 'eth0'
  virtual_router_id = '50'
  priority = '100'
  advert_int = '1'
  auth_pass = 'fgshsrth'
  virtual_ip = '10.0.0.50/24'
  vrrp_scripts = [
    [ 'name' => 'check_something'
      'script' => '/usr/bin/test_service',
      'interval' => '',
      'rise' => '',
      'fall' => '',
      'weight' => '',
    ],
  ]
  service_ensure = 'running'
  service_enable = true,
  # Provide paths to executable if you want to use notify.
  notify_main => false,
  notify_master = false,
  notify_backup = false,
  notify_fault = false,
  notify_stop = false,
}
```
## Limitations

This module will only work on servers/systems with systemd.
