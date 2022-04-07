# =Class node-red::package
class node-red::package inherits node-red {
  require node-red::selinux
  require node-red::user

  include ::nodejs

  nodejs::npm::global_config_entry { 'unsafe-perm':
    ensure => present,
    value  => true,
    before => Package['node-red']
  }

  package { 'node-red':
    ensure   => $node-red::version,
    provider => 'npm',
    require  => Package['npm']
  }

  file { $node-red::base_dir:
    ensure => directory,
    owner  => $node-red::owner,
    group  => $node-red::group,
    mode   => '0755',
  }
}
