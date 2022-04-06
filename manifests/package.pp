# =Class nodered::package
class nodered::package inherits nodered {
  require nodered::selinux

  include ::nodejs

  package { 'nodered':
    ensure   => $nodered::version,
    provider => 'npm',
    require  => Package['npm']
  }

  file { $nodered::base_dir:
    ensure => directory,
    owner  => $nodered::owner,
    group  => $nodered::group,
    mode   => '0755',
  }
}
