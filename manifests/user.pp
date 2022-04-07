# =Class nodered::user
class nodered::user inherits nodered {
  if $nodered::manage_user {
    group { $nodered::group:
      ensure => present
    }

    user { $nodered::owner:
      ensure     => present,
      gid        => $nodered::group,
      home       => $nodered::real_home,
      managehome => $nodered::manage_home,
      require    => Group[$nodered::group]
    }

    if $nodered::manage_keys {
      file { "${nodered::real_home}/.ssh":
        ensure  => directory,
        owner   => $nodered::owner,
        group   => $nodered::group,
        mode    => '0700',
        require => User[$nodered::owner],
      }

      $nodered::ssh_keys.each |$filename, $key| {
        file { "${nodered::real_home}/.ssh/${filename}":
          ensure  => file,
          content => $key,
          owner   => $nodered::owner,
          group   => $nodered::group,
          mode    => '0600',
          require => File["${nodered::real_home}/.ssh"],
        }
      }
    }
  }
}
