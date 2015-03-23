# == Class: mopd
#
# Full description of class mopd here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { mopd:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class mopd (
  $service_ensure = $::mopd::params::service_ensure,
  $service_enable = $::mopd::params::service_enable,
  $service_flags  = $::mopd::params::service_flags,
  $mop_directory  = $::mopd::params::mop_directory,
) inherits mopd::params {
  file { $mop_directory:
    ensure      => 'directory',
    owner       => 'root',
    group       => '0',
    mode        => '0755',
  }
  service { 'mopd':
    enable      => $service_enable,
    ensure      => $service_ensure,
    hasrestart  => true,
    hasstatus   => true,
    flags       => $service_flags,
    require     => File[$mop_directory],
  }
}
