# =Class nodered::package
class nodered::package inherits nodered {
  require nodered::selinux
  require nodered::user

  include ::nodejs

  nodejs::npm::global_config_entry { 'unsafe-perm':
    ensure => present,
    value  => true,
    before => Package['node-red']
  }

  package { 'node-red':
    ensure   => $nodered::version,
    provider => 'npm',
    require  => Package['npm']
  }

  file { $nodered::flow_dir:
    ensure => directory,
    owner  => $nodered::owner,
    group  => $nodered::group,
    mode   => '0755',
  }
}
