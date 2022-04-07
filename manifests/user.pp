# =Class nodered::user
class nodered::user inherits nodered {
  if $nodered::manage_user {
    group { $nodered::group:
      ensure => present
    }

    user { $nodered::owner:
      ensure  => present,
      gid     => $nodered::group,
      require => Group[$nodered::group]
    }
  }
}
